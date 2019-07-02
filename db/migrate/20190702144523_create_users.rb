class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest

      t.string :name
      t.string :fav_type
      t.string :fav_stat

      t.timestamps
    end
  end
end
