Rails.application.routes.draw do
  # get 'types/index'
  # get 'types/show'
  # get 'pokemons/index'
  # get 'pokemons/show'


  root to: 'pokemons#index'
  resources "pokemons", only: %i[index show]
  resources "types", only: %i[index show]

end
