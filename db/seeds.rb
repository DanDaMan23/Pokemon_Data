require 'rest-client'
require 'json'


Pokemon.delete_all
Ability.delete_all
# Move.delete_all
Type.delete_all

def get_types()
    type_url = "https://pokeapi.co/api/v2/type/"
    response = RestClient.get(type_url)

    parsed = JSON.parse(response)
    parsed["results"]
end

def get_pokemon(number)
    pokemon = "https://pokeapi.co/api/v2/pokemon/#{number}"
    response = RestClient.get(pokemon)
    JSON.parse(response)
end

def get_ability(number)
    ability = "https://pokeapi.co/api/v2/ability/#{number}"
    response = RestClient.get(ability)
    JSON.parse(response)
end

def get_move(number_or_name)
    move = "https://pokeapi.co/api/v2/move/#{number_or_name}"
    response = RestClient.get(move)
    JSON.parse(response)
end

get_types().each do |type|
    Type.create(name: type["name"])
end

# (1..50).each do |i|

# end

(1..200).each do |i|
    pokemon = get_pokemon(i)
    pokemon_name = pokemon["name"]
    pokemon_types = pokemon["types"]
    pokemon_abilities = pokemon["abilities"]
    # pokemon_moves = pokemon["moves"]

    pokemon_types_object = Array.new
    pokemon_abilities_objects = Array.new
    # pokemon_moves_objects = Array.new

    pokemon_types.each do |type|
        pokemon_types_object << Type.find_by(name: type["type"]["name"])
    end

    pokemon_abilities.each do |ability|
        pokemon_abilities_objects << Ability.find_or_create_by(name: ability["ability"]["name"])
    end

    # pokemon_moves.each do |move|
    #     move_detail = get_move(move["move"]["name"])
    #     pokemon_moves_objects << Move.find_or_create_by(name: move_detail["name"], type: Type.find_by(move_detail["type"]["name"]) )
    # end

    Pokemon.create(name: pokemon_name, types: pokemon_types_object)
end

# Pokemon.create(name: "Venusaur", types: [Type.find_by(name: "grass"), Type.find_by(name: "poison")])

# puts get_pokemon(3)["moves"][0]["move"]["name"]

# puts get_move("curse")["type"]["name"]

puts "Types created: #{Type.count}"
puts "Pokemons created: #{Pokemon.count}"
puts "Abilities created: #{Ability.count}"
# puts "Moves created: #{Move.count}"
