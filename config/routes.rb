Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show] do
    resources :user_languages, only: [:new, :create]
    resources :appointments, only: [:new, :create, :destroy]
  end
  resources :appointments, only: [:update]
  get "/dashboard", to: "dashboard#show", as: :dashboard
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
