Rails.application.routes.draw do
  resources :instruments, only: %i[create show index update destroy]
  resources :programs, only: %i[create show index update destroy]
  resources :teachers, only: %i[create show index update destroy]
end
