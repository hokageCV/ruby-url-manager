Rails.application.routes.draw do
  devise_for :users

  post '/create-shortened-url', to: 'home#create_shortened_url', as: 'create_shortened_url'


  root 'home#index'
end
