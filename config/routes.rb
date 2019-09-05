Rails.application.routes.draw do
  resources :answers
  resources :questions
  resources :topics
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users do
    member do
      get :activation
    end
  end

  resources :sessions

  root "questions#index"
end
