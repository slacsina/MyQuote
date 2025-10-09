Rails.application.routes.draw do
  #get "search/index"
  #get "about/index"
  resources :categories
  resources :quotes
  resources :authors
  resources :users

  get '/admin', to: 'home#aindex'
  get '/userhome', to: 'home#uindex'
  get '/your-quotes', to: 'home#uquotes'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'search', to: 'search#index'
  get '/about', to: 'about#index'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
