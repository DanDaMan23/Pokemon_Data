require 'rest-client'
require 'json'
# require 'poke-api-v2'

Type.delete_all
Pokemon.delete_all
Ability.delete_all

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

get_types().each do |type|
    Type.create(name: type["name"])
end

(1..200).each do |i|
    pokemon = get_pokemon(i)
    pokemon_name = pokemon["name"]
    pokemon_types = pokemon["types"]
    pokemon_abilities = pokemon["abilities"]

    pokemon_types_object = Array.new

    pokemon_abilities_objects = Array.new

    pokemon_types.each do |type|
        pokemon_types_object << Type.find_by(name: type["type"]["name"])
    end

    pokemon_abilities.each do |ability|
        pokemon_abilities_objects << Ability.find_or_create_by(name: ability["ability"]["name"])
    end

    Pokemon.create(name: pokemon_name, types: pokemon_types_object)
end

# Pokemon.create(name: "Venusaur", types: [Type.find_by(name: "grass"), Type.find_by(name: "poison")])


# puts get_pokemon(3)["abilities"][0]["ability"]["name"]


puts "Types created: #{Type.count}"
puts "Pokemons created: #{Pokemon.count}"
puts "Abilities created: #{Ability.count}"