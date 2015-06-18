'use strict';

var React = require('react');

var Actions = Reflux.createActions([
    "addUser",
    "editUser",
    "deleteUser",
    "cancelEditingUser",
    "inputChange"
]);

var store = Reflux.createStore({
    listenables: [Actions],
    
    init: function() {
        this.people = [{first: "John", last: "Doe"},
                {first: "Jack", last: "Horvat"},
                {first: "Jane", last: "Smith"}];
    },
    
    onAddUser: function(){
        this.newUser();
        this.editUser(this.people.length - 1);
        this.trigger(this);
    },
    
    onEditUser: function(index){
        this.editUser(index);
        this.trigger(this);
    },
    
    onDeleteUser: function(index){
        this.deleteUser(index);
        this.trigger(this);
    },
    
    onCancelEditingUser: function(index){
        this.deselectUser();
        this.trigger(this);
    },

    /*
        Changes the state of the selected person
    */
    onInputChange: function(part, val) {


                    // Gets the selected user index from the object
                    var k = this.currentPerson;
                    
                    if(typeof k !== 'undefined') {

                        // State of "k" (ex: 0 or 1 or 2) and "part" (ex: "first" or "last") of the "k"
                        // object is set as the input field value
                        this.people[k][part] = val;
                        this.trigger(this);
                    }
                },

    /*
        Gets the selected "Edit Name" row
    */
    editUser: function(k) {
    
                    console.log("Selected Index:", k);
                    console.log("Name:", this.people[k].first, this.people[k].last);

                    // Save the selected index inside the object as "currentPerson"
                    this.currentPerson = k;
                },

    /*
        Remove the currentPerson from the object,
        hiding the <Input> and <Output> components
    */
    deselectUser: function() {
                    delete this.currentPerson;
                },

    /*
        Add a new (empty) user into the object
    */
    newUser: function() {
                    this.people.push({first: "", last: ""});
                },

    /*
        Delete the selected person from the object
    */
    deleteUser: function(k) {
                    delete this.currentPerson;
                    this.people.splice(k, 1);
                }
});

var historyStore = Reflux.createStore({
    listenables: [Actions],

    init: function() {
        this.hist = [];
    },

    onAddUser: function(){
        this.hist.push("Add User Clicked!");
        this.trigger(this.hist);
    },
    
    onEditUser: function(index){
        this.hist.push("Edit User Clicked!");
        this.trigger(this.hist);
    },
    
    onDeleteUser: function(index){
        this.hist.push("Delete User Clicked!");
        this.trigger(this.hist);
    },
    
    onCancelEditingUser: function(index){
        this.hist.push("Hide form clicked!");
        this.trigger(this.hist);
    }
});

/*
    Returns the "k" object out of state array
*/
var getCurrentPerson = function() {
    
    var k = store.currentPerson;
    
    if(typeof k !== 'undefined') {
        return store.people[k];
    }
};

/*
    Returns a function that triggers "inputChange" event
*/
var assignNamePart = function(part) {

    return function(ev) {
        Actions.inputChange(part, ev.target.value);
    }
};

var App = React.createClass({
    mixins: [Reflux.connect(store,"peopleStore"),
            Reflux.connect(historyStore, "history")],
    
    getInitialState: function() {
        return {
            peopleStore: store,
            history: []
        }
    },
    
    render: function() {
        return (
            <div>
                <button onClick={this.addUser}>Add User</button>
                <Table dataObj={this.state.peopleStore.people} peopleStore={this.state.peopleStore}/>
                {this.renderForm()}
                <Hist hist={this.state.history}/>
            </div>
        );
    },

    renderForm: function(){
        
        if(typeof this.state.peopleStore.currentPerson !== 'undefined') {
            return (
                    <div>
                        <Input firstName={getCurrentPerson().first} lastName={getCurrentPerson().last}/>
                        <Output outputFn={this.getName()}/>
                    </div>
                );
        }
    },

    /*
        Prints the full name into the <Output>
    */
    getName: function() {

        var first = this.state.peopleStore.people[this.state.peopleStore.currentPerson].first;
        var last = this.state.peopleStore.people[this.state.peopleStore.currentPerson].last;

        if (first == "" && last == "") {
            return "Both fields must be entered!";
        } else if (first == "") {
            return "Please enter a first name!";
        } else if (last == "") {
            return "Please enter a last name!";
        } else {
            return "Name: " + first + " " + last;
        }
    },

    /*
        Calls the "newUser" event
    */
    addUser: function() {
        Actions.addUser();
    }
});

var Table = React.createClass({

    render: function() {
        var self = this;
        return (
            <table>
                <thead>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                    </tr>
                </thead>
                
                <tbody>
                    
                    {_.map(this.props.dataObj, function(row, i) {
                      return (
                        <tr key={i}>
                          {_.map(row, function(v, k) {
                            return <td key={k} className={self.highlight(i)}>{v}</td>;
                          })}

                          <td><button onClick={self.editSelectedUser(i)}>Edit Name</button></td>
                          <td><button onClick={self.deleteSelectedUser(i)}>Delete User</button></td>
                        </tr>
                      );
                    })}

                </tbody>
            </table>
        );
    },

    /*
        Call the "selectUser" event, passing the current row value
    */
    editSelectedUser: function(k) {
        return function() {
            Actions.editUser(k);
        }
    },

    /*
        Call the "deleteSelectUser" event, passing the current row value
    */
    deleteSelectedUser: function(k) {
        return function() {
            Actions.deleteUser(k);
        }
    },

    /*
        Highlight the field that is being edited by
        assigning a CSS class to that row
    */
    highlight: function(i) {
        if(this.props.peopleStore.currentPerson === i) {
            return "active";
        }
    }
});

var Input = React.createClass({
    
    render: function() {
        return (
            <div>
                <input type="text" placeholder="Your First Name" value={this.props.firstName} onChange={assignNamePart("first")}/>
                <input type="text" placeholder="Your Last Name" value={this.props.lastName} onChange={assignNamePart("last")}/>
                <button onClick={this.closeForm}>X</button>
            </div>
        );
    },

    /*
        Call the "deselectUser" event
    */
    closeForm: function() {
        Actions.cancelEditingUser();
    }
});

var Output = React.createClass({

    render: function() {
        return (
            <p>{this.props.outputFn}</p>
        );
    }
});

var Hist = React.createClass({

    render: function() {
        return (
            <div>
                {_.map(this.props.hist, function(v, k) {return <p key={k}>{v}</p>;})}
            </div>
        );
    }
});

React.render(<App/>, document.getElementById('app'));