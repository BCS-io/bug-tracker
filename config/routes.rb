Rails.application.routes.draw do
  resources :projects
  devise_for :accounts
  get "pages/home"
  root to: "pages#home"
end
