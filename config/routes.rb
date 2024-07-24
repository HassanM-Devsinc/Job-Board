Rails.application.routes.draw do
  devise_for :users
  resources :admins
  resources :jobs
  resources :applicants
  post '/applicants/apply/:job_id', to: 'applicants#apply', as: 'apply_job'
  root "users#index"
end
