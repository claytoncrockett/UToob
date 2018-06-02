Rails.application.routes.draw do
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

  devise_for :users
end
