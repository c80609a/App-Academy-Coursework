# iterate over each pokemon.
# Use json.set! to explicitly set the key to the pokemon's id.
# Use json.extract! to grab the pokemon's id, name, and image_url.

@pokemons.each do |pokemon|
  json.set! pokemon.id do
    json.extract! pokemon, :id, :name
    json.image_url asset_path(pokemon.image_url)
  end
end
