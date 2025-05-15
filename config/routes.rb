Rails.application.routes.draw do
  # Default health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Root route — serve Frontend index.html
  root "frontend#index"
end
