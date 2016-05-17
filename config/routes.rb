Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    post 'facebook', to: 'sessions#facebook'
    resources :sales do
      collection do
        get 'me'
      end
    end
    devise_for :user, skip: [:sessions, :password], defaults: { format: :json }
    resources :users, only: [:index, :show]
    resources :regions, only: [:index, :show]
    get 'me', to: 'users#me'
    post 'me/can', to: 'users#can'
    resources :profiles, only: [:create, :update]
    resources :vegs, only: [:index]
  end
end
