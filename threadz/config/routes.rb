Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :create, :show]
  resources :outfits
  resources :clothings
  resources :comments
  # resources :comments, only: [:create, :update, :destroy]

root "outfits#index"
get "/signup", to: "users#new", as: :signup
# post "/users", to: "users#create"
get "/login", to: "sessions#new", as: :login
post "/login", to: "sessions#create"
delete "/logout", to: "sessions#destroy", as: :logout
end
