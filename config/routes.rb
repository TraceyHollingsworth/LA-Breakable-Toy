Rails.application.routes.draw do
  devise_for :users
  resources :courses do
    resources :lessons, only: [:create, :show]
  end

  root 'homes#index'
end
