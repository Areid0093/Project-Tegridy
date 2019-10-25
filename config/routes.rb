Rails.application.routes.draw do
  resources :job_postings, only: :index do
    match 'advanced_search' => 'job_postings#advanced_search',
          on: :collection, via: [:get, :post], as: :advanced_search
  end
  resources :job_posting_filters
  root "home#index"
  resources :bookmarks
  resources :filters
  resources :job_applications
  # resources :job_postings
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :job_postings do
    resources :job_applications, :except => [:index]
  end
 
  resources :job_postings do
    resources :bookmarks, :except => [:index]
  end
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post 'login', to: "sessions#create"
  get "logout", to: "sessions#destroy", as: "logout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
