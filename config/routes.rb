Rails.application.routes.draw do

  post '/album/:id/add', to: 'album#add'
  delete '/album/:id/photo/:photo_id', to: 'album#delete_photo'

  resources :album
  resources :photo

  devise_for :users

  get 'static/index'
  root 'static#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
