Rails.application.routes.draw do
  devise_for :users
    resources :users
    resources :albums
    root to: 'users#show'
end
