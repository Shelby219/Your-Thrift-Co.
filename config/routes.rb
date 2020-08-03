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

  # .....  
  # Shopping Cart
  #resources :carts, only: %i[index create destroy]
  get '/carts', to: 'carts#show'
  post '/carts', to: 'carts#create'
  delete '/carts', to: 'carts#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
    


