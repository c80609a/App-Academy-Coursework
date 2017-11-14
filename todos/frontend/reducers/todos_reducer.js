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
  //before the switch, be safe and freeze your object
  Object.freeze(state);
  let nextState;

  switch(action.type) {
    case RECEIVE_TODOS:
      nextState = {};
      action.todos.forEach ((obj) => {
        nextState[obj.id] = obj;
      });

      return nextState;

    case RECEIVE_TODO:
      const newTodo = {};
      const newKey = action.todo.id;
      newTodo[newKey] = action.todo;
      return merge({}, state, newTodo);

    case REMOVE_TODO:
      nextState = merge({}, state);
      delete nextState[action.todo.id];
      return nextState;
    default:
      return state;
  }
};


export default todosReducer;
