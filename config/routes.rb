Rails.application.routes.draw do
  devise_for :users
  resources :admins
  resources :jobs
  resources :applicants
  post '/applicants/apply/:job_id', to: 'applicants#apply', as: 'apply_job'
  get '/jobs/:id/show_applicants', to: 'jobs#show_applicants', as: 'show_applicants_job'
  root "users#index"
end
