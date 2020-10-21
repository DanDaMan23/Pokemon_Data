class PokemonsController < ApplicationController
  def index
    @q = Pokemon.ransack(params[:q])
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
