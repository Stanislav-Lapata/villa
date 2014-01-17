JqVilla::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :villas do
    resources :requests, only: :create
  end
  resources :areas do
    get :for_admin, on: :collection
  end

  resources :contacts, only: :create

  namespace :admin do
    resources :images do
      post :update_positions, on: :collection
    end
  end

  %w[sale yacht car estate_rental estate_sale].each do |action|
    get "/#{action}s/:id", to: "villas#show_#{action}", as: action
  end

  get '/sales', to: 'villas#sales', as: :sales

  get '/real_estate_rentals', to: 'villas#real_estate_rentals', as: :real_estate_rentals
  get '/real_estate_sales', to: 'villas#real_estate_sales', as: :real_estate_sales
  get '/yacht_rentals', to: 'villas#yacht_rentals', as: :yacht_rentals
  get '/car_rentals', to: 'villas#car_rentals', as: :car_rentals
  get '/faq', to: 'home#faq', as: :faq
  get '/contact', to: 'home#contact', as: :contact

  get '/set_locale/:locale', to: 'home#setup_locale', as: :set_locale

  root 'home#index'
end
