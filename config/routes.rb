Rails.application.routes.draw do
  root 'labels#index'

  resources :labels do
    resources :artists,  only: [:index, :show] do
      resources :albums, only: [:index, :show]
    end
  end

  resources :artists
  resources :albums
end
