Rails.application.routes.draw do
  # Default health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Auth routes
  post "/signup", to: "auth#signup"
# config/routes.rb
post '/login', to: 'sessions#create'


  # Root route — serve Frontend index.html
  root "frontend#index"
end
