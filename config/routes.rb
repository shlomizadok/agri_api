Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    resources :sales
    devise_for :user, skip: [:sessions, :password], defaults: { format: :json }
    resources :users, only: [:index, :show]
    resources :regions, only: [:index, :show]
    get 'me', to: 'users#me'
    resources :profiles, only: [:create, :update]
  end
end
