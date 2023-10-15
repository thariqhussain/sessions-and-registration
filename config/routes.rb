Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  get '/login', to: 'users#login'
  post '/login', to: 'users#authenticate'
  delete '/logout', to: 'users#logout'

  root "main_pages#index"
end
