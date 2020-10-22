class Type < ApplicationRecord
    has_and_belongs_to_many :pokemons
    has_and_belongs_to_many :abilities
    has_many :moves 

    validates :name, presence: true
    validates :name, length: {minimum: 3}
    validates :name, uniqueness: true
end
