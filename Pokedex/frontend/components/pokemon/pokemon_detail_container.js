import { connect } from 'react-redux';
import { requestAPokemon } from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';

const mapStateToProps = state => ({
  poke: (state.entities.pokemon[state.ui.pokeDisplay]),
  items: state.entities.items
});

const mapDispatchToProps = dispatch => ({
  requestAPokemon: (id) => dispatch(requestAPokemon(id))
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);
