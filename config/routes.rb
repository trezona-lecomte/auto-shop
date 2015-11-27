Rails.application.routes.draw do
  root "product_requests#new"

  resources :product_requests, only: [:new, :create]
end
