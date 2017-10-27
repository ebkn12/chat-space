Rails.application.routes.draw do
  devise_for :users
  resources :groups, except: [:index, :show, :destroy] do
    resources :messages, only: [:index, :new, :create]
  end
  resources :users, only: [] do
    collection do
      get "search"
    end
  end
  root "messages#index"
end
