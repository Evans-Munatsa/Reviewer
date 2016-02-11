Rails.application.routes.draw do
  devise_for :users
  resources :books do
    resources :rates
  end
  root 'books#index'
end
