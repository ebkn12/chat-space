Rails.application.routes.draw do
  devise_for :users
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :new]
  end
  root "messages#index"
end
