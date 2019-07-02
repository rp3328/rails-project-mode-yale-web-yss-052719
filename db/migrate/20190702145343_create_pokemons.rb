class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|

      t.string :name
      t.string :japanese_name
      t.integer :pokedex_number
      t.float :percentage_male
      t.string :type1
      t.string :type2
      t.string :classification
      t.float :height_m 
      t.float :weight_kg
      t.integer :capture_rate
      t.integer :base_egg_steps
      # t.array :abilities #don't do array - convert to string if it does not 
      t.integer :experience_growth
      t.integer :base_happiness
      # t.against_?
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :sp_attack
      t.integer :sp_defense
      t.integer :speed
      t.integer :generation
      t.boolean :is_legendary


      t.timestamps
    end
  end
end
