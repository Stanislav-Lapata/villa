Newvilla::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'home/list', to: 'home#list'

  get '/gallery', to: 'home#gallery', as: :villa_gallery
  get '/rates', to: 'home#rates', as: :villa_rates
  get '/location', to: 'home#location', as: :villa_location
  get '/contact_us', to: 'home#contact', as: :villa_contact_us

  get '/villas', to: 'home#index'
  get '/house_rentals', to: 'home#index'
  get '/house_sales', to: 'home#index'
  get '/yacht_rentals', to: 'home#index'
  get '/car_rentals', to: 'home#index'
  get '/real_estate', to: 'home#index'
  get '/sales', to: 'home#index'
  get '/faq', to: 'home#index'
  get '/contact', to: 'home#index'
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

  resources :phuket do
    collection do
      get :house_rentals
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
      get :phuket, on: :collection
    end
    resources :requests
    resources :contacts
    resources :subscribes
    resources :faqs
    resources :home_photos, only: :index
  end

  namespace :snapshots do
    resources :villas, only: [:index, :show]
    resources :sales, only: [:index, :show]
  end

  root 'home#index'
end
