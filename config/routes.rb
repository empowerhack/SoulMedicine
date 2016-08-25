Rails.application.routes.draw do

  get 'sessions/new'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'user#index'
    get 'pin/verify'
    get 'pages/:page' => 'pages#show', as: 'find_out_more'
    get '/signup' => 'user_preference#index'
    get 'user_preference/create'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'
    match ':controller(/:action(/:id))', :via => [:get, :post, :patch]
  end
  
  require 'sidekiq/web'
  authenticate :admin_user do
    mount Sidekiq::Web => '/sidekiq'
  end
  
end