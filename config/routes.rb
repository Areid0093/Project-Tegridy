Rails.application.routes.draw do
  root "home#index"
<<<<<<< HEAD
=======

>>>>>>> master
  resources :bookmarks
  resources :filters
  resources :job_applications
  resources :job_postings, only: [:index, :show]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
