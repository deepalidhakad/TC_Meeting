  Rails.application.routes.draw do  

       root "sessions#welcome"
     
       get 'login', to: 'sessions#new'   
       post 'login', to: 'sessions#create'  
       get 'welcome', to: 'sessions#welcome'   
       get 'authorized', to: 'sessions#page_requires_login'
       get '/logout' => 'sessions#destroy'
       get '/search', to: 'events#search'
       
       resources :users
       resources :events
       resources :rooms
       resources :password_resets

       get '/expried_index', to: 'events#expried_index'

  end