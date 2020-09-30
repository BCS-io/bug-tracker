Rails.application.routes.draw do
  resources :projects, shallow: true do
    resources :issues, module: :projects
  end
  get "/projects" => "projects#index", :as => :account_root
  devise_for :accounts
  get "pages/home"
  root to: "pages#home"
end
