Rails.application.routes.draw do
  resources :carts
  resources :user_jwts, only: [:create]
  resources :stores, only: [:create, :destroy, :show, :index]
  resources :users
  resources :items 

  get '/profile', to: 'users#profile'
  patch '/items/decrement/:id', to: 'items#decrement'
  patch '/items/increment/:id', to: 'items#increment'
  get '/newcart', to: 'carts#newCart'
  get '/clearcart', to: 'carts#clearCart'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
