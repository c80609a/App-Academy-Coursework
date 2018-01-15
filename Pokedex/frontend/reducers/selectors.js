import values from 'lodash/values';

const selectAllPokemon = (pokemon) => {
  return values(pokemon); //pay attention
};

export default selectAllPokemon;
