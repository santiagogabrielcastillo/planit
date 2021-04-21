Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :providers, only: %I[show new create edit update]

  resources :providers do
    resources :services, only: %i[new create show]
  end
end
