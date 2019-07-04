class PokemonsController < ApplicationController

    def index
        @pokemons = Pokemon.all

    end

    def show
        @user = current_user
        @pokemon = Pokemon.find(params[:id])
    end

    def edit
        @pokemon = Pokemon.find(params[:id])
    end

    def update
        @pokemon = Pokemon.find(params[:id])
        @pokemon.update(pokemon_params)
        redirect_to pokemon_path(@pokemon)
    end



    private
    def pokemon_params(*args)
        params.require(:pokemon).permit(*args)
    end

end