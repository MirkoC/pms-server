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

state.on("selectUser", function(k) {
    
    console.log("Selected Index: ", k);
    console.log(this.data.people[k].first, this.data.people[k].last);

    this.data.currentPerson = k;

    this.trigger("change");
});

state.on("inputChange", function(part) {

    console.log(part);

    // State change

    this.trigger("changeListener");
});

state.on("changeListener", function() {

    // Do something.

});

var getCurrentPerson = function() {
    
    var k = state.data.currentPerson;
    
    if(typeof k !== 'undefined') {
        return state.data.people[k];
    }
}

var assignNamePart = function(part) {

    return function() {
        state.trigger("inputChange", [part]);
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
                            return <td key={k}>{v}</td>;
                          })}

                          <td><button onClick={self.makeSelectUser(i)}>Edit Name</button></td>
                        </tr>
                      );
                    })}

                </tbody>
            </table>
        );
    },

    makeSelectUser: function(k){
        return function(){
            state.trigger('selectUser', [k]);
        }
    }
});

var Input = React.createClass({
    
    render: function() {
        return (
            <div>
                <input type="text" placeholder="Your First Name" value={this.props.firstName} onChange={assignNamePart("first")}/>
                <input type="text" placeholder="Your Last Name" value={this.props.lastName} onChange={assignNamePart("last")}/>
            </div>
        );
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