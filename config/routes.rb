Rails.application.routes.draw do

  root 'public/homes#show'

  devise_for :admins, controllers: {
    sessions:       'admins/sessions',
    passwords:      'admins/passwords',
    registrations:  'admins/registrations'
  }

  devise_for :customers, controllers: {
    sessions:       'customers/sessions',
    passwords:      'customers/passwords',
    registrations:  'customers/registrations'
  }

  namespace :admin do
    get "/"=>"homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end
  
  namespace :public do
    get "/about"=>"homes#about"
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :index, :show, :create]
    get "/orders/success"=>"orders#success"
    post "/orders/confirm"=>"orders#confirm"
    patch "/customers/withdraw" =>"customers#withdraw"
    get "/customers/result" => "customers#result"
    resources :customers, only:[:show, :edit, :update]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :shipping_adresses, only: [:index, :edit, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
