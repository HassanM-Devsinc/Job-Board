Rails.application.routes.draw do
  devise_for :users
  resources :admins
  root "users#index"

  resources :jobs do
    resources :applicants, only: [:index]
    post 'apply', on: :member
  end

  resources :applicants, except: [:show, :destroy]
end
