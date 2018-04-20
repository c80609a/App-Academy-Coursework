import { RECEIVE_ERRORS, CLEAR_ERRORS } from '../actions/error_actions';



const errorsReducer = (state = [], action) => {
  Object.freeze(state);
  let nextState;

  switch(action.type) {
    case RECEIVE_ERRORS:
      nextState = [];
      action.errors.forEach((error) => {
        nextState.push(error);
      });
      return nextState;
    case CLEAR_ERRORS:
      return [];
    default:
      return state;
  }
};

export default errorsReducer;
