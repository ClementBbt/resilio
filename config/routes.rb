Rails.application.routes.draw do
  get 'resiliations/index'
  get 'resiliations/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :subscriptions, only: [ :new, :create, :index, :show ] do
    member do
      # route pour les transactions d'une subscription
    end
  end

  resources :transactions, only: [ :index ]
end
