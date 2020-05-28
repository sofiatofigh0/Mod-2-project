Rails.application.routes.draw do
  resources :bar_reviews
  resources :restaurant_reviews
  resources :users
  resources :bars
  resources :restaurants 
 
  delete '/sessions/reset', to: 'sessions#reset_session', as: 'reset'
  get '/sessions/new', to: 'sessions#new', as: 'new_login'
  post '/sessions', to: 'sessions#create', as: 'login'
  delete '/session', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
