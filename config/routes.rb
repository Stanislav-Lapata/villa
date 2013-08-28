Newvilla::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'rentals', to: 'villas#index'

  resources :areas do
    get :areas, on: :collection
    post :update_positions, on: :collection
  end

  resources :villas do
    resources :requests, only: :create

    get :show_villa, on: :collection
    get :list, on: :collection
  end

  namespace :api, defaults: { format: 'json' } do
    resources :villas
    resources :areas
    resources :requests
  end


  root 'home#index'

end
