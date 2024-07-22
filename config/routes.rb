Rails.application.routes.draw do
  devise_for :users
  resources :admins
  root "pages#home"
end
