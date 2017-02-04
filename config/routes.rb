Rails.application.routes.draw do
  get "/signup", to: "users#signup"

  get "/profile", to: "users#profile"

  root to: 'root#index'
end
