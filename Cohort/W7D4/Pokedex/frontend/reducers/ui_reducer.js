import { RECEIVE_A_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const uiReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState;

  switch (action.type) {
    case RECEIVE_A_POKEMON:
      const poke = action.poke.pokemon;
      nextState = { pokeDisplay: poke.id };
      return merge({}, state, nextState);
    default:
      return state;
  }


};

export default uiReducer;
