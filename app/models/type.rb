class Type < ApplicationRecord
    has_and_belongs_to_many :pokemons
    has_and_belongs_to_many :abilities
end
