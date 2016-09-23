Rails.application.routes.draw do

  get 'sessions/new'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'user#index'
    get 'pin/verify'
    get 'pages/:page' => 'pages#show', as: 'get_page'
    get '/signup' => 'user_preference#index'
    get 'user_preference/create'
    get '/courses' => 'courses#index'
    get '/course/:id' => 'courses#show', as: 'course'
    get '/lesson/:id' => 'courses#lesson', as: 'lesson'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'
    match ':controller(/:action(/:id))', :via => [:get, :post, :patch]
  end
  
  require 'sidekiq/web'
  authenticate :admin_user, lambda { |u| u.canSidekiq? }  do
    mount Sidekiq::Web => '/sidekiq'
  end
  
end