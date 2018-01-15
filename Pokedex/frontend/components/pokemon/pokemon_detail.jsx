import React from 'react';

class PokemonDetail extends React.Component {
  constructor () {
    super();
  }

  componentDidMount () {
    this.props.requestAPokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps (newProps) {
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
    this.props.requestAPokemon(newProps.match.params.pokemonId);
    }
  }

  render () {
    const { poke, items } = this.props;
    console.log(poke);
    if (!poke) {
      return null;
    }
    return (
      <div>
        <span>Pokemon Detail Component</span>
          <h2>{poke.name}</h2>
          <img src={poke.image_url} />
          <p>Type: {poke.poke_type}</p>
          <p>Attack: {poke.attack}</p>
          <p>Defense: {poke.defense}</p>
          <p>Moves: {poke.moves}</p>
          

      </div>


    );
  }
}

export default PokemonDetail;
