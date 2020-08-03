Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :edit, :update]
  
  resources :sessions, only: [:create]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  resources :days, only: [:index, :show]
  get '/days/today', to: 'days#today'

  
  
  get '/about', to: 'static#about'
  get '/help', to: 'static#help'
  root 'static#index'
end
