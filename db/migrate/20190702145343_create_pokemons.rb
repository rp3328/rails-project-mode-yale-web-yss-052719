class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|

      t.string :title
      t.string :img_url

      t.timestamps
    end
  end
end
