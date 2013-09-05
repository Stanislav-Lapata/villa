Newvilla::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'rentals', to: 'villas#index'
  get 'sales', to: 'villas#index'
  get 'home/list', to: 'home#list'

  resources :areas do
    get :areas, on: :collection
    post :update_positions, on: :collection
  end

  resources :villas do
    resources :requests, only: :create

    get :show_villa, on: :collection
    get :list, on: :collection
    get :sales, on: :collection
  end

  namespace :api, defaults: { format: 'json' } do
    resources :villas
    resources :areas do
      get :home, on: :collection
    end
    resources :requests
    resources :contacts
  end

  root 'home#index'
end
