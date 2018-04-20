# {
#   pokemon: {
#     id: 5,
#     name: 'Rhydon',
#     attack: 130,
#     defense: 120,
#     image_url: "assets/5.svg",
#     moves: [
#       'horn attack',
#       //...
#     ],
#     poke_type: 'ground',
#   }
#   items: [
#     {
#       id: 15,
#       name: 'Dark Vulcan',
#       pokemon_id: 5,
#       price: 12,
#       happiness: 58,
#       image_url: "/assets/pokeball.svg"
#     },
#     //...
#   ]
# }

# pokemon
json.pokemon do
  json.extract! @pokemon, :id, :name, :attack, :defense, :poke_type
  json.image_url asset_path(@pokemon.image_url)
  json.moves do
    json.array! @pokemon.moves
  end
end

# items
json.items do
  json.array! @pokemon.items do |item|
    json.extract! item, :id, :name, :pokemon_id, :price, :happiness
    json.image_url asset_path(item.image_url)
  end
end
