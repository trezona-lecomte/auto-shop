Rails.application.routes.draw do
  root "product_requests#new"

  resources :product_requests, only: [:new, :create]
  # Omniauth callback route:
  get "/auth/:provider/callback", to: "sessions#create"
  delete "/sign_out",             to: "sessions#destroy"
  default_url_options host: "http://test.host"
end
