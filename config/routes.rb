Rails.application.routes.draw do
  devise_for :users
  resources :machines do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :destroy]
  root to: "machines#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
