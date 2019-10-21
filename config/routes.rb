Rails.application.routes.draw do
  resources :bookmarks
  resources :categories
  resources :job_applications
  resources :job_postings
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
