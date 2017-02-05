Rails.application.routes.draw do
  get '/login',                   :to => 'sessions#new',    :as => :login
  get '/logout',                  :to => 'sessions#logout', :as => :logout
  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/failure',            :to => 'sessions#failure'

  get '/dashboard', :to => 'dashboard#show', :as => :dashboard

  get "/profile", to: "users#profile", :as => :profile

  root to: 'root#index'
end
