class Pokemon < ApplicationRecord
    has_many :likes
    has_many :saves

    has_many :users, through: :likes
    has_many :saved_users, through: :saves, source: :users

    
end
