class Pokemon < ApplicationRecord
    has_and_belongs_to_many :types
    has_and_belongs_to_many :abilities

    validates :name, presence: true
    validates :name, length: {minimum: 3}
    validates :name, uniqueness: true

end
