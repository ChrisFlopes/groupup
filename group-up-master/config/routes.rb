Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :meetups do
    resources :create, controller: 'meetups/setup'
    resources :participations, only: [:new]
    member do
      get "create/review", to: 'meetups/setup#review'
    end
  end

  resources :groups do
    resources :members, only: [:new]
  end

  resources :groupmeetups do
    resources :create, controller: 'groupmeetups/setup'
  end

  root to: 'pages#home'
  get 'join_meetup', to: 'pages#join_meetup'
  get 'events', to: 'pages#events'
  get 'landing', to: 'pages#landing'
end
