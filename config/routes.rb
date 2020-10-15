Rails.application.routes.draw do
  get 'pages/home'
  # get 'types/index'
  # get 'types/show'
  # get 'pokemons/index'
  # get 'pokemons/show'


  root to: 'pages#home'
  resources "pokemons", only: %i[index show]
  resources "types", only: %i[index show]

end
