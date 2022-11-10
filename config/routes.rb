Rails.application.routes.draw do
  resources :instruments, only: [:create, :index, :update, :destroy]
  resources :programs, only: [:create, :index, :update, :destroy]
  resources :teachers, only: [:create, :index, :update, :destroy]
end
