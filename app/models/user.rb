class User < ApplicationRecord

    has_many :likes
    has_many :saves

    has_many :pokemons, through: :likes
    has_many :saved_pokemons, through: :saves, source: :pokemons

    has_secure_password

end
