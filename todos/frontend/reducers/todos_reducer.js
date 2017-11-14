import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions';
import merge from 'lodash/merge';

const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  switch(action.type) {
    case RECEIVE_TODOS:
      const newState = {};
      action.todos.forEach ((obj) => {
        newState[obj.id] = obj;
      });

      return newState;

    case RECEIVE_TODO:
      const newTodo = {};
      const newKey = action.todo.id;
      newTodo[newKey] = action.todo;
      return merge({}, state, newTodo);

    case REMOVE_TODO:
      Object.freeze(state);
      const newState1 = merge({}, state);
      const todoKey = action.todo.id;
      if (Object.keys(newState1).includes(todoKey)) {
        delete newState1.todoKey;
      }
      return newState1;
    default:
      return state;
  }
};


export default todosReducer;
