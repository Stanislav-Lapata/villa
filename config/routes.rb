Newvilla::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'home/list', to: 'home#list'

  get '/villas', to: 'home#index'
  get '/sales', to: 'home#index'
  get '/villas/:id', to: 'home#index', constraints: { id: /\d+/ }
  get '/sales/:id', to: 'home#index', constraints: { id: /\d+/ }

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

    collection do
      get :show_villa
      get :show_sales_villa
      get :list
      get :sales
    end
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
