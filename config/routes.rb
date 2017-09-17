Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
    resources :users
    resources :albums do

      resources :photos

    end

    resources :comments
    
    root to: "users#show"
end
