JqVilla::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :villas
  resources :requests, only: :create
  resources :areas do
    get :for_admin, on: :collection
  end

  namespace :admin do
    resources :images do
      post :update_positions, on: :collection
    end
  end

  get '/sales', to: 'villas#sales', as: :sales
  get '/faq', to: 'home#faq', as: :faq
  get '/contact', to: 'home#contact', as: :contact

  root 'home#index'
end
