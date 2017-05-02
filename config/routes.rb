Rails.application.routes.draw do
  devise_for :users
  resources :groups, except: [:index, :show, :destroy] do
    resources :messages, only: [:index, :new]
  end
  root "messages#index"
end
