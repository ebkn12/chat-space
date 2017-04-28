Rails.application.routes.draw do
  devise_for :users
  resources :groups, only: [:new, :create]
  root "messages#index"
end
