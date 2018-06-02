Rails.application.routes.draw do
  root 'static_pages#home'
  
    devise_for :users
  
  resources :videos do
    resources :comments
  end
  resources :playlists do
    resources :videos
  end
  resources :users do
    resources :playlists
  end
  resources :users do
    resources :comments
  end
  resources :comments


end
