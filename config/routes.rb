Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }
  root to: 'pages#home'

  resources :games, only: [:index, :show, :new, :create] do
    resources :trades, only: [:new]
  end

  resources :trades, only: [:create, :show]
end
