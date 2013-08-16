Newvilla::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'rentals', to: 'villas#index'

  resources :villas

  root 'home#index'

end
