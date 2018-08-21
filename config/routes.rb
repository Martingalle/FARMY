Rails.application.routes.draw do
  devise_for :users
  root to: "machines#index"
  resources :machines do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :destroy]

  # Routes / Controller for user dashboard
  get '/my-machines', to: "machines#list"
  
  # Route to home
  root to: "machines#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
