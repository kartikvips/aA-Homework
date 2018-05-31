import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { fetchSearchGiphys } from './util/api_util.js';

document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('root');
    // const store = configureStore();
    window.fetchSearchGiphys = fetchSearchGiphys;
    ReactDOM.render(<h1>daba daba doo</h1>, root);

});