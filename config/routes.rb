JqVilla::Application.routes.draw do

  resources :villas

  get '/sales', to: 'villas#sales', as: :sales

  root 'home#index'
end
