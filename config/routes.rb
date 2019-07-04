Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :update, :edit, :show, :destroy]
  resources :pokemons, only: [:index, :show]

root "sessions#new"

  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  get "/users/:id/poketeam", to: "users#poketeam"
  patch "/pokemons/:id/like", to: "pokemons#like", as: "like_pokemon"
  patch "/pokemons/:id/recruit", to: "pokemons#recruit", as: "recruit_pokemon"


  
end
