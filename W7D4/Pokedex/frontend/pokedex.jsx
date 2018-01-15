import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { HashRouter, Route } from 'react-router-dom';

import { receiveAllPokemon, requestAllPokemon, requestAPokemon } from './actions/pokemon_actions';
import selectAllPokemon from './reducers/selectors';

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  window.dispatch = store.dispatch;
  window.requestAPokemon = requestAPokemon;
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, rootEl);
});
