Rails.application.routes.draw do

  resources :users
  resources :main_pages
  
  root "main_pages#index"

end
