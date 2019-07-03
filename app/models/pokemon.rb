class Pokemon < ApplicationRecord
    has_many :likes
    has_many :saves

    has_many :users, through: :likes
    has_many :saved_users, through: :saves, source: :users


    

    def self.customize(pokemons, weight_arr)
        arr = []
        while !pokemons.empty?
            pokemon = pokemons.sample
            type_sample = weight_arr.sample
            if type_sample == pokemon.type1 || type_sample == pokemon.type2
                    arr << pokemon
                    pokemons = pokemons.select { |poke| poke.id != pokemon.id }
            end
        end

        return arr
    end

    # def self.types
    #     arr = []
    #     self.all.each do |pokemon|
    #         arr << pokemon.type1
    #         arr << pokemon.type2
    #     end 
    #     arr.uniq.reject { |e| e.to_s.empty? } 
    # end

    # def stats
    #     @stat_list = ["hp", "attack", "defense", "sp_attack", "sp_defense", "speed"]
    # end

    # def img_name 
    #     @imgs = []
    #     Dir.new('.').each {|file| @imgs << file }
    # end

    def img_path
        g = {
            "nidoran♀" => "nidoran-f",
            "nidoran♂" => "nidoran-m",
            "deoxys" => "deoxys-normal",
            "wormadam" => "wormadam-plant",
            "meloetta" => "meloetta-aria",
            "flabébé" => "flabebe",
            "meowstic" => "meowstic-male",
            "minior" => "minior-meteor",
            "oricorio" => "oricorio-baile",
            "shaymin" => "shaymin-land",
            "aegislash" => "aegislash-blade",
            "basculin" => "basculin-red-striped",
            "pumpkaboo" => "pumpkaboo-average",
            "giratina" => "giratina-altered",
            "gourgeist" => "gourgeist-average",
            # "farfetch'd" => "farfetchd"
            # "mr. mime" => "mr-mime"
            "zygarde" => "zygarde-50",
            "hoopa" => "hoopa-confined",
            "lycanroc" => "lycanroc-midday",
            "wishiwashi" => "wishiwashi-solo",
            "type:-null" => "type-null",
            "darmanitan" => "darmanitan-standard",
            "tornadus" => "tornadus-incarnate",
            "thundurus" => "thundurus-incarnate",
            "landorus" => "landorus-incarnate",
            "keldeo" => "keldeo-ordinary"

        }
        
        name = self.name.downcase.gsub(/['.]/, '') 
        name = name.gsub(/[ ]/, '-')

        if g.keys.include?(name)
            g[name]
        else
            name
        end
    end

    
end
