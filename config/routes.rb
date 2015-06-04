Rails.application.routes.draw do
  
  devise_for :users
  
  devise_scope :user do
    get 'register', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  
  
  get 'training_log', to: "workouts#index"
  
  resources :workouts do
    resources :workout_exercises
  end
  
  resources :exercises
  
  root 'home#index'

end
