Rails.application.routes.draw do
  root 'books#index'

  resources :books, only: [:update]
end
