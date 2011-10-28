PhotoContest::Application.routes.draw do
  get "contestants/new"

    resources :contestants   :only => [:new, :create, :update, :show]
    resources :contestant_entries :only => [:index, :update]
    
    match '/enter',   :to =>   'contestants#new'    
    match '/rules',   :to =>   'pages#rules'
    match '/admin/gallery',   :to =>   'contestant_entries#index'
    root :to => 'pages#home' 

end
