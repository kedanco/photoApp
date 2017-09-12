Rails.application.routes.draw do
  devise_for :users
    resources :users
    resources :albums
    root to: 'pages#index'
end
