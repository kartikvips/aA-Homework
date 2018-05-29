import React from 'react';
import ReactDOM from 'react-dom';

import Calculator from './calculator';

document.addEventListener('DOMContentLoaded', () => {
	const main = document.getElementById('main');
	ReactDOM.render(<Calculator />, main);
	// ReactDOM.render(<h1>WHAT IT DO</h1>, main);
});