class CreateSaves < ActiveRecord::Migration[5.2]
  def change
    create_table :saves do |t|


      t.boolean :vote
      t.integer :user_id
      t.integer :pokemon_id
      
      t.timestamps
    end
  end
end
