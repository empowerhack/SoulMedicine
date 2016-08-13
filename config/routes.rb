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

  constraints SubdomainConstraint do
    get "/", to: 'users#index', constraints: { subdomain: ['soulmedicine-staging', 'soulmedicine'] }, via: [:get, :post, :put, :patch, :delete]
  end
end
