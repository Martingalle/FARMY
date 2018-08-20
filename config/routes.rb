Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/destroy'
  get 'machines/index'
  get 'machines/show'
  get 'machines/new'
  get 'machines/create'
  get 'machines/edit'
  get 'machines/update'
  get 'machines/destroy'
  devise_for :users
  resources :machines do
    resources :bookings, only: [:index, :show, :create]
  end
  resources :bookings, only: [:destroy]
  root to: "machines#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
