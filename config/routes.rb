Rails.application.routes.draw do
  # resources :sales
  resources :carts
  resources :user_jwts, only: [:create]
  resources :stores, only: [:create, :destroy, :show, :index]
  resources :users
  resources :items 

  get '/profile', to: 'users#profile'
  get '/clearcart', to: 'carts#clearCart'
  get '/subtotal', to: 'carts#cartTotal'
  post '/newcart', to: 'carts#newCart'
  post '/create_items', to: 'items#create_new'
  get '/delete', to: 'sales#delete'
  get '/deletestore', to: 'stores#delete'
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
