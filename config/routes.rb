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

#       Prefix Verb   URI Pattern                        Controller#Action
#        login GET    /login(.:format)                   sessions#new
#       logout GET    /logout(.:format)                  sessions#logout
#              GET    /auth/:provider/callback(.:format) sessions#create
# auth_failure GET    /auth/failure(.:format)            sessions#failure
#    dashboard GET    /dashboard(.:format)               dashboard#show
#      pledges POST   /pledges(.:format)                 pledges#create
#              GET    /pledges(.:format)                 pledges#index
#       pledge GET    /pledges/:id(.:format)             pledges#show
#              PUT    /pledges/:id(.:format)             pledges#update
#              DELETE /pledges/:id(.:format)             pledges#destroy
#       tweets GET    /tweets(.:format)                  tweets#index
#      profile GET    /profile(.:format)                 users#profile
#         root GET    /                                  root#index
