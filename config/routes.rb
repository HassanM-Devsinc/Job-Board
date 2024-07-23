Rails.application.routes.draw do
  devise_for :users
  resources :admins
  resources :jobs
  resources :applicants
  root "users#index"
end
