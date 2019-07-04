class User < ApplicationRecord

    has_many :likes
    has_many :recruits

    has_many :pokemons, through: :likes
    has_many :recruited_pokemons, through: :recruits, source: :pokemon

    has_secure_password

end
