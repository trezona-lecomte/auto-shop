Rails.application.routes.draw do
  resources :product_requests, only: [:new, :create]
end
