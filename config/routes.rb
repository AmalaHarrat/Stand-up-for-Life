Rails.application.routes.draw do
  devise_for :users
  root to: "missions#index"
  resources :users, only: [:show]
  get "dashboard", to: "dashboards#show"
  # shallow: supprime nesté si pas besoin
  resources :missions, only: [:show], shallow: true do
    resources :bookings, only: %i[show create]
  end

  namespace :organisation do
    resources :missions, only: %i[index show new create edit update]
    resources :bookings, only: %i[edit update]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
