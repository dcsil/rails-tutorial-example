Rails.application.routes.draw do
  resources :channels
  devise_for :users
  resources :users
  resources :memberships, only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
