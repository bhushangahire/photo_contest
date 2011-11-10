PhotoContest::Application.routes.draw do
    devise_for :users

    get "contestants/new"

    resources :contestants         
    resources :contestant_entries  
    
    match '/enter',   :to =>   'contestants#new'    
    match '/rules',   :to =>   'pages#rules'
    match 'home',  :to =>  'pages#home'   
    root :to => 'pages#home' 

end
