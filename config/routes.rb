Rails.application.routes.draw do
  devise_for :accounts
  get "pages/home"
  root to: "pages#home"
end
