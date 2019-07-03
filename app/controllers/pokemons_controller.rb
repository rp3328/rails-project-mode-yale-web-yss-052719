class PokemonsController < ApplicationController

    def index
        @pokemons = Pokemon.all
    end

    def show
        @pokemon = Pokemon.find(params[:id])
    end

    private
    def pokemon_params(*args)
        params.require(:pokemon).permit(*args)
    end

end