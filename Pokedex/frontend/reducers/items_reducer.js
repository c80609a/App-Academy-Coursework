import { RECEIVE_A_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const itemsReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState;

  switch (action.type) {
    //in this one, we are dealing with integrating the items into a slice of state
    case RECEIVE_A_POKEMON:
      const items = action.poke.items;
      nextState = {};

      items.forEach ((item) => { nextState[item.id] = item; } );
      return merge({}, state, nextState);
    default:
      return state;
  }

};

export default itemsReducer;
