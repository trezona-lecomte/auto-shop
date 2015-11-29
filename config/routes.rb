Rails.application.routes.draw do
  resources :recommendations
  root "resumes#index"

  # Omniauth callback route:
  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/failure",            to: "sessions#oauth_failure"
  delete "/sign_out",             to: "sessions#destroy"

  resources :users, only: [:show] do
    resources :recommendations, only: [:index]
  end

  default_url_options host: "http://test.host"
  # index show new edit create update destroy
end
