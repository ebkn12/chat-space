Rails.application.routes.draw do
  devise_for :users
  resources :groups, only: [:new, :create, :edit] do
    resources :messages, only: [:index, :show]
  end
  root "messages#index"
end
