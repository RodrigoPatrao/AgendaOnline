Rails.application.routes.draw do
  devise_for :users
  resources :contacts
  root to: 'pages#index'
end
