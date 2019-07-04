class User < ApplicationRecord

    has_many :likes
    has_many :recruits

    has_many :pokemons, through: :likes
    has_many :recruited_pokemons, through: :recruits, source: :pokemon

    has_secure_password validations: false
    validates :full_name, :username, :email, presence: true

    validates :password, presence: {message: 'You must enter a password'},
                       length: {minimum: 16,
                       message: 'Your password must contain at least 16 characters'}
    validates_confirmation_of :password, allow_blank: true


    def weight_gen
        
        types = ["grass", "poison", "fire", "flying", "water", "bug", "normal", "dark", "electric", "ground", "ice", "fairy", "fighting", "psychic", "rock", "steel", "ghost", "dragon"]
        feed = Hash[types.map {|a| [a, 1]}]
        Pokemon.all.each do |pokemon|
            if pokemon.likes != []
                if pokemon.type2 == nil
                    feed[pokemon.type1] += 2
                else
                    feed[pokemon.type1] += 2
                    feed[pokemon.type2] += 2
                end
            end
        end
        
        num_of_times = []

        feed.each do |type, val|
            val.times {num_of_times << type}
        end
        return num_of_times
    end

end
