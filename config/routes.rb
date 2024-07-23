Rails.application.routes.draw do
  devise_for :users
  resources :admins
  resources :jobs
  root "users#index"
end
