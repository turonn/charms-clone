Rails.application.routes.draw do
  resources :instruments, only: [:create, :index, :update, :destroy]
end
