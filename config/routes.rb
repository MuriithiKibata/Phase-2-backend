Rails.application.routes.draw do
  resources :carts
  resources :user_jwts, only: [:create]
  resources :stores, only: [:create, :destroy, :show, :index]
  resources :users
  resources :items 

  get '/profile', to: 'users#profile'
  get '/clearcart', to: 'carts#clearCart'
  get '/subtotal', to: 'carts#cartTotal'
  patch '/items/decrement/:id', to: 'items#decrement'
  patch '/items/increment/:id', to: 'items#increment'
  post '/newcart', to: 'carts#newCart'
  post '/create_items', to: 'items#create_new'
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
