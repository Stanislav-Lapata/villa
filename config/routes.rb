Newvilla::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'rentals', to: 'villas#index'
  get 'sales', to: 'villas#index'
  get 'home/list', to: 'home#list'

  resources :areas do
    # get :areas, on: :collection
    get 'areas/:category', to: 'areas#areas', on: :collection
    post :update_positions, on: :collection
  end

  namespace :admin do
    resources :images do
      post :update_positions, on: :collection
    end
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
      get :for_admin, on: :collection
    end
    resources :requests
    resources :contacts
  end

  root 'home#index'
end
