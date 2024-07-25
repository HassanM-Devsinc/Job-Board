Rails.application.routes.draw do
  root "members#home"
  devise_for :users
  
  resources :jobs do
    resources :applicants, only: [:index]
    post 'apply', on: :member
  end

  resources :applicants, except: [:show, :destroy]
  resources :members, only: [:index, :new, :create]
end
