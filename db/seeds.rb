require 'rest-client'
require 'json'

Type.delete_all



def get_types()
    type_url = "https://pokeapi.co/api/v2/type/"
    response = RestClient.get(type_url)

    parsed = JSON.parse(response)
    parsed["results"]
end

get_types().each do |type|
    Type.create(name: type["name"])
end


puts "Types created: #{Type.count}"