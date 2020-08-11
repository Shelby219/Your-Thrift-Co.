Rails.application.routes.draw do

  devise_for :users
  get 'users/:id', to: 'users#show'
  resources :users
     
  #additional routes 
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    #get 'users', to: 'devise/sessions#new'
  end

  # Items Routes
  resources :items
  

 # ROOT page   
  root 'pages#home'  
 
  # PAGES Routes
  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about' 
  get '/terms', to: 'pages#terms'
  get '/support', to: 'pages#support'   
  get '/privacy', to: 'pages#privacy'

  # PAYMENTS Routes
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"

  
  get '/mycart', to: 'carts#show'
  post '/cart/:item_id', to: 'carts#create', as: "cart"
  delete '/cart/item/:item_id', to: 'carts#destroy', as: "delete_item"
 
end
    

   
