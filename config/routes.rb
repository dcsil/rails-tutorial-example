Rails.application.routes.draw do
  resources :channels do
    resources :messages, only: [:create, :update, :destroy]
    resources :memberships, only: :destroy
  end

  devise_for :users
  resources :users
end
