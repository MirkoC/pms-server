'use strict';

var React = require('react');

var App = React.createClass({
    
    getInitialState : function(){
        return {
            first: "",
            last: ""
        }
    },

    render: function() {
        return (
            <div>
                <Input inputFirstParam={this.makeSetPart("first")} inputLastParam={this.makeSetPart("last")}/>
                <Output outputFn={this.getName()}/>
            </div>
        );
    },

    makeSetPart: function(part) {

        var self = this;

        return function(ev){

            self.setNamePart(part, ev);
        }
    },

    setNamePart: function(part, ev) {

        var fieldText = ev.target.value.toUpperCase();

        this.state[part] = fieldText;

        this.setState(this.state);
    },

    getName: function() {

        var first = this.state.first;
        var last = this.state.last;

        console.log("first: " + first + " last: " + last);

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

var Input = React.createClass({    
    
    render: function() {
        return (
            <div>
                <input type="text" placeholder="Your First Name" onChange={this.props.InputFirstParam}/>
                <input type="text" placeholder="Your Last Name" onChange={this.props.InputLastParam}/>
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