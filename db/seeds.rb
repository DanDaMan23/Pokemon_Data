require 'rest-client'
require 'json'
require 'poke-api-v2'

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

get_types().each do |type|
    Type.create(name: type["name"])
end

puts get_pokemon(1).inspect


puts "Types created: #{Type.count}"