import React from 'react';
import { SSL_OP_SSLEAY_080_CLIENT_DH_BUG } from 'constants';

class Calculator extends React.Component{
  constructor(){
    super();
    //your code here
    this.state = {result: 0, num1: "", num2: ""};


  }

  //your code here

  render(){
    return (
      <div>
        <h1>Calculator</h1>
        <h2>{this.state.result}</h2>
        <input onChange={this.setNum1.bind(this)} value={this.state.num1}/>
        <input onChange={this.setNum2.bind(this)} value={this.state.num2}/>
        <button onClick={this.clear.bind(this)}>Clear</button>
        <br />
        <button onClick={this.add.bind(this)}>+</button>
        <button onClick={this.subtract.bind(this)}>-</button>
        <button onClick={this.multiply.bind(this)}>*</button>
        <button onClick={this.divide.bind(this)}>/</button>

      </div>
    );
  }

  setNum1(e){
    const num1 = parseInt(e.target.value);
    this.setState({num1});
  }
  setNum2(e){
    const num2 = parseInt(e.target.value);
    this.setState({num2});
  }
  clear(e){
    e.preventDefault;
    this.setState({num1: "", num2: "", result: 0});
  }
  add(e){
    e.preventDefault;
    this.setState({num1: "", num2: "", result: (this.state.num1 + this.state.num2)});
  }
  subtract(e){
    e.preventDefault;
    this.setState({num1: "", num2: "", result: (this.state.num1 - this.state.num2)});
  }
  multiply(e){
    e.preventDefault;
    this.setState({num1: "", num2: "", result: (this.state.num1 * this.state.num2)});
  }
  divide(e){
    e.preventDefault;
    this.setState({num1: "", num2: "", result: (this.state.num1 / this.state.num2)});
  }
}

export default Calculator;
