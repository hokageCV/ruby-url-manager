Rails.application.routes.draw do
  devise_for :users

  post '/create-shortened-url', to: 'home#create_shortened_url', as: 'create_shortened_url'

  get '/:short_code', to: 'shortened_urls#redirect_to_original'
  get '/404', to: 'errors#not_found'

  root 'home#index'
end
