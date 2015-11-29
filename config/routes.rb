Rails.application.routes.draw do
  root "product_requests#new"

  # Omniauth callback route:
  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/failure",            to: "sessions#oauth_failure"
  delete "/sign_out",             to: "sessions#destroy"

  resources :product_requests, only: [:show, :new, :create] do
    resources :offers, only: [:index]
  end

  default_url_options host: "http://test.host"
end
