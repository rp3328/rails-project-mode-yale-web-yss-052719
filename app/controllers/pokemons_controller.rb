class PokemonsController < ApplicationController

    before_action :set_pokemon, except: [:index]
    before_action :set_user

    def index
        @pokemons = Pokemon.customize(Pokemon.all, current_user.weight_gen)
    end

    def show
    end

    def edit
    end

    def update
        @pokemon.update(pokemon_params)
        redirect_to pokemon_path(@pokemon)
    end

    def like
        like = Like.find_by(pokemon: @pokemon, user: @user)
        like ? like.destroy : Like.create(pokemon: @pokemon, user: @user)
        redirect_to pokemon_path(@pokemon)
    end
    
    def recruit
        recruit = Recruit.find_by(pokemon: @pokemon, user: @user)
        recruit ? recruit.destroy : Recruit.create(pokemon: @pokemon, user: @user)
        redirect_to pokemon_path(@pokemon)
    end

    private
    def pokemon_params(*args)
        params.require(:pokemon).permit(*args)
    end

    def set_pokemon
        @pokemon = Pokemon.find(params[:id])
    end

    def set_user
        @user = current_user
    end

end