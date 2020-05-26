Rails.application.routes.draw do
  resources :bar_reviews
  resources :restaurant_reviews
  resources :users
  resources :bars
  resources :restaurants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
