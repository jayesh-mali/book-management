Rails.application.routes.draw do
  # resources :users
  resources :reviews
  resources :books
  resources :authors

  get 'search', to: 'search#search'

  post 'login', to: 'sessions#authenticate'
  post 'signup', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
