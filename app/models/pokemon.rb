class Pokemon < ApplicationRecord
    has_many :likes
    has_many :saves

    has_many :users, through: :likes
    has_many :saved_users, through: :saves, source: :users

    def self.types
        arr = []
        self.all.each do |pokemon|
            arr << pokemon.type1
            arr << pokemon.type2
        end 
        arr.uniq.reject { |e| e.to_s.empty? } 
    end

    # def stats
    #     @stat_list = ["hp", "attack", "defense", "sp_attack", "sp_defense", "speed"]
    # end

    # def img_name 
    #     @imgs = []
    #     Dir.new('.').each {|file| @imgs << file }
    # end

end
