Rails.application.routes.draw do
  get '/login',                   :to => 'sessions#new',    :as => :login
  get '/logout',                  :to => 'sessions#logout', :as => :logout
  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/failure',            :to => 'sessions#failure'

  get '/dashboard', :to => 'dashboard#show', :as => :dashboard

  post '/pledges',        :to => 'pledges#create',  :as => :pledges
  get '/pledges',         :to => 'pledges#index'
  get '/pledges/:id',     :to => 'pledges#show',    :as => :pledge
  put '/pledges/:id',     :to => 'pledges#update'
  delete '/pledges/:id',  :to => 'pledges#destroy'

  get '/tweets', :to => 'tweets#index'

  get "/profile", to: "users#profile", :as => :profile

  root to: 'root#index'
end
