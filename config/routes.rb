Rails.application.routes.draw do
  resources :articles
  devise_for :users
  root to: "articles#index"
end
