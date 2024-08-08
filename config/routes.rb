Rails.application.routes.draw do
  get 'private/test'
  root "members#home"
  devise_for :users
  
  resources :jobs do
    resources :applicants, only: [:index]
    post 'apply', on: :member
  end

  resources :applicants, except: [:show, :destroy]
  resources :members, only: [:index, :new, :create]

  namespace :api do
    namespace :v1 do
      
      devise_for :users, controllers: {
        sessions: 'api/v1/users/sessions',
        registrations: 'api/v1/users/registrations'
      }

      resources :jobs do
        resources :applicants, only: [:index]
        post 'apply', on: :member
      end
    
      resources :applicants, except: [:show, :destroy]
      resources :members, only: [:index, :new, :create]
    end
  end
end