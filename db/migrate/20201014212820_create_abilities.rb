class CreateAbilities < ActiveRecord::Migration[6.0]
  def change
    create_table :abilities do |t|
      t.string :name

      t.timestamps
    end

    create_table :pokemons_abilities, id: false do |t|
      t.belongs_to :pokemon
      t.belongs_to :ability
    end

    create_table :abilities_types, id: false do |t|
      t.belongs_to :ability
      t.belongs_to :type
    end
  end
end
