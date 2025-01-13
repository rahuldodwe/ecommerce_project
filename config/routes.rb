Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  resources :admins
  resources :users
  resources :categories
  resources :products do 
  end

  resource :cart, only: [:create, :show, :destroy]

  resource :admin, only: [:show], controller: :admin

  resources :checkouts, only: [:new, :create] do
    collection do
      post :direct_buy
    end
  end

  resources :search_results, only: [:index, :show]

  resources :addresses, only: [:new, :create, :index]
  resources :payments, only: [:new, :create]

  resources :orders, only: [:index, :show]
 
  root "products#index"
end
