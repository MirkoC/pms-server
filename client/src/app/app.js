'use strict';

var React = require('react');

var state = {
    data: {
        people: [
                {first: "John", last: "Doe"},
                {first: "Jack", last: "Horvat"},
                {first: "Jane", last: "Smith"}
            ]
    },

    newUser: function() {
        this.data.people.push({first: "", last: ""});
    },

    __evHandlers : {},

    on : function(evName, fn) {
        
        this.__evHandlers[evName] = this.__evHandlers[evName] || [];
        this.__evHandlers[evName].push(fn);
    },

    trigger : function(evName, args) {
        
        var evHandlers = this.__evHandlers[evName] || [];
        var self = this;
        
        _.map(evHandlers, function(fn){
            fn.apply(self, args);
        })
    }
}

/*
    Gets the selected "Edit Name" row
*/
state.on("selectUser", function(k) {
    
    console.log("Selected Index:", k);
    console.log("Name:", this.data.people[k].first, this.data.people[k].last);

    // Save the selected index inside the object as "currentPerson"
    this.data.currentPerson = k;
    this.trigger("change");
});

/*
    Changes the state of the selected person
*/
state.on("inputChange", function(part, ev) {

    // Gets the selected user index from the object
    var k = state.data.currentPerson;
    
    if(typeof k !== 'undefined') {

        // State of "k" (ex: 0 or 1 or 2) and "part" (ex: "first" or "last") of the "k"
        // object is set as the input field value
        state.data.people[k][part] = ev.target.value;
        state.trigger("change");
    }
});

/*
    Remove the currentPerson from the object,
    hiding the <Input> and <Output> components
*/
state.on("deselectUser", function(k) {
    delete this.data.currentPerson;
    this.trigger("change");
});

/*
    Add a new (empty) user into the object
*/
state.on("newUser", function(k) {

    state.newUser();

    var last = state.data.people.length - 1;

    state.data.currentPerson = last;
    this.trigger("change");
});

/*
    Delete the selected person from the object
*/
state.on("deleteUser", function(k) {

    delete state.data.currentPerson;
    state.data.people.splice(k, 1);
    this.trigger("change");
});

/*
    Returns the "k" object out of state array
*/
var getCurrentPerson = function() {
    
    var k = state.data.currentPerson;
    
    if(typeof k !== 'undefined') {
        return state.data.people[k];
    }
}

/*
    Returns a function that triggers "inputChange" event
*/
var assignNamePart = function(part) {

    return function(ev) {
        state.trigger("inputChange", [part, ev]);
    }
}

var App = React.createClass({
    
    getInitialState : function(){
        
        var self = this;
        
        state.on('change', function(){
            self.forceUpdate();
        })

        return state;
    },

    render: function() {
        return (
            <div>
                <button onClick={this.addUser}>Add User</button>
                <Table dataObj={this.state.data.people}/>
                {this.renderForm()}
            </div>
        );
    },

    renderForm: function(){
        
        if(typeof state.data.currentPerson !== 'undefined') {
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

        var first = this.state.data.people[this.state.data.currentPerson].first;
        var last = this.state.data.people[this.state.data.currentPerson].last;

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
        state.trigger("newUser");
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

                          <td><button onClick={self.makeSelectUser(i)}>Edit Name</button></td>
                          <td><button onClick={self.deleteSelectUser(i)}>Delete User</button></td>
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
    makeSelectUser: function(k) {
        return function() {
            state.trigger('selectUser', [k]);
        }
    },

    /*
        Call the "deleteSelectUser" event, passing the current row value
    */
    deleteSelectUser: function(k) {
        return function() {
            state.trigger('deleteUser', [k]);
        }
    },

    /*
        Highlight the field that is being edited by
        assigning a CSS class to that row
    */
    highlight: function(i) {
        if(state.data.currentPerson === i) {
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
        state.trigger("deselectUser");
    }
});

var Output = React.createClass({

    render: function() {
        return (                
            <p>{this.props.outputFn}</p>
        );
    }
});

React.render(<App/>, document.getElementById('app'));