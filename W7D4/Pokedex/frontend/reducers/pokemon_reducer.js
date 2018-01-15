import { RECEIVE_ALL_POKEMON, RECEIVE_A_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState;

  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return merge({}, state, action.pokemon);
    case RECEIVE_A_POKEMON:
      //payload comes back now with two sub-slices, pokemon and items
      //here, we grab the poke and set it as an Object
      const poke = action.poke.pokemon;
      //now we can iterate over the items, getting just the ids for the reference array
      poke.item_ids = action.poke.items.map(item => item.id);
      return merge({}, state, { [poke.id]: poke });

    default:
      return state;
  }
};

export default pokemonReducer;
