class Recruit < ApplicationRecord
    belongs_to :pokemon
    belongs_to :user
end
