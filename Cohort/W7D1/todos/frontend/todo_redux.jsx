import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { receiveTodo, receiveTodos, fetchTodos } from './actions/todo_actions';
import Root from './components/root.jsx';
import allTodos from './reducers/selectors';


document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();
  //kill the next line before production
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.allTodos = allTodos;
  window.fetchTodos = fetchTodos;

  ReactDOM.render(<Root store={ store }/>, root);
});
