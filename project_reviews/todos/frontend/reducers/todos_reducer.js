import {
  RECEIVE_TODO,
  RECEIVE_TODOS,
} from "../actions/todos_actions";
import merge from 'lodash/merge';

const todosReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_TODO:
    case RECEIVE_TODOS:
    default:
      return state;
  }


};
