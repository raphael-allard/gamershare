Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }
  root to: 'pages#home'

  resources :games, only: [:index, :new, :create]
end
