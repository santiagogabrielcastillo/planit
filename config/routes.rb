Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  get 'success', to: "pages#success", as: "success"
  get 'orders/:id/confirm', to: "orders#confirm", as: "confirm_order"
  patch 'orders/:id/paid', to: "orders#paid", as: "paid_order"

  resources :providers, only: %I[show new create edit update]

  resources :providers do
    resources :services, only: %i[new create show]
  end

  resources :orders, only: %i[create edit update show]
end
