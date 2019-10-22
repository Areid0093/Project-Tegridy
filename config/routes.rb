Rails.application.routes.draw do
  root "home#index"
  resources :bookmarks
  resources :filters
  resources :job_applications
  resources :job_postings
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
