Rails.application.routes.draw do
  scope path: '/api' do
    api_version(module: 'Api::Exposed::V1', path: { value: 'v1' }, defaults: { format: 'json' }) do
      resources :pichangas do
        post '/join', to: "pichangas#join"
      end
      resources :pichangas, only: [:index, :create, :update, :destroy]
      #resources :users, only: [:index, :create, :update]
      resources :users do
        get '/current', to: "users#current"
      end
      resources :locations, only: [:create,:index, :show]
      post '/login', to: "users#login"
      post '/signup', to: "users#create"
      post '/google' => 'users#google'
      get 'latest', to: "pichanga#latest" 
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
end
