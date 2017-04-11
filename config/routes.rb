Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registraions: "users/registrations"
  }
  root "messages#index"
end
