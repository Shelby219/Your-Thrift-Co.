Rails.application.routes.draw do

  devise_for :users
  get 'users/:id', to: 'users#show'
  resources :users
     
  #additional routes 
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    #get 'users', to: 'devise/sessions#new'
  end
  
  resources :items
  #get 'sign_in', to: 'items/user'

 # Root page   
  root 'pages#home'  
 
  # Pages just for Viewing 
  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
  get '/terms', to: 'pages#terms'
  get '/support', to: 'pages#support'
  get '/privacy', to: 'pages#privacy'


  get '/mycart', to: 'carts#show'
  post '/cart/:item_id', to: 'carts#create', as: "cart"
  delete '/cart/item/:item_id', to: 'carts#destroy', as: "delete_item"
  #resources :cart_items, only: [:create, :destroy]
  #get    'cart',     to: 'carts#index'
  #delete "/cart/:cart_id/destroy/:item_id", to: "cart_items#destroy"
end
    


