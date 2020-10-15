class Ability < ApplicationRecord
    has_and_belongs_to_many :types
    has_and_belongs_to_many :pokemons

    validates :name, presence: true 
end
