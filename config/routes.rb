Rails.application.routes.draw do


  devise_for :users

  #additional routes 
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'users', to: 'devise/sessions#new'
  end



  resources :items
 # Root page   
  root 'pages#home'  
 
  # Pages just for Viewing 
  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
  get '/terms', to: 'pages#terms'
  get '/support', to: 'pages#support'
  get '/privacy', to: 'pages#privacy'

  # .....
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
    


