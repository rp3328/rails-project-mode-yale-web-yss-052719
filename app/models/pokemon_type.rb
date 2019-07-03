class PokemonType < ApplicationRecord
    belongs_to :type
    belongs_to :pokemon
end
