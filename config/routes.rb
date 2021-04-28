Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get '/', to: redirect('/categories/47')
  root to: 'categories#index'
  get 'success', to: 'pages#success', as: 'success'
  get 'orders/:id/confirm', to: 'orders#confirm', as: 'confirm_order'
  patch 'orders/:id/paid', to: 'orders#paid', as: 'paid_order'

  resources :providers, only: %I[show new create edit update]

  resources :providers do
    resources :services, only: %i[new create show edit update]
  end

  resources :categories, only: %I[show index]

  resources :orders, only: %i[create edit update show index]

  resources :users, only: %I[show edit update] do
    resources :credit_cards, only: %I[new create edit update show destroy]
  end
end
