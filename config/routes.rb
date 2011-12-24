PhotoContest::Application.routes.draw do
    devise_for :users

    get "contestants/new"

    match 'contestant_entries/top_ten', :to =>  "contestant_entries#top_ten" , :as => :top_ten
    match 'contestant_entries/stats', :to =>  "contestant_entries#stats" , :as => :stats

    resources :contestants         
    resources :contestant_entries  
    
    #contest terminated
    match '/enter',   :to =>   'pages#enter'      
    #contest is running    
    #match '/enter',   :to =>   'contestants#new'  
  
    match '/rules',   :to =>   'pages#rules'
    match 'home',  :to =>  'pages#home'   
    root :to => 'pages#home' 

end
