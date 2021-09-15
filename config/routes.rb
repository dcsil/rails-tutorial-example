Rails.application.routes.draw do
  resources :messages
  resources :channels do
    resources :memberships, only: :destroy
  end

  devise_for :users
  resources :users
end
