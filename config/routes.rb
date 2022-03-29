  Rails.application.routes.draw do  
    
       resources :events

       get 'rooms/new'
     
       get 'login', to: 'sessions#new'   
       post 'login', to: 'sessions#create'  
       get 'welcome', to: 'sessions#welcome'   
       get 'authorized', to: 'sessions#page_requires_login'
       get '/logout' => 'sessions#destroy'

       resources :users

       root "sessions#welcome"

       get '/search', to: 'events#search'
    
  end