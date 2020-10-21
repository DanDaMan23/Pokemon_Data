class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.page(params[:page])
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
