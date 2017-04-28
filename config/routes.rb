Courses::Application.routes.draw do
  root to: 'users#index'

  get 'log_out' => 'sessions#destroy', :as => 'log_out'
  get 'log_in' => 'sessions#new', :as => 'log_in'
  get 'sign_up' => 'users#new', :as => 'sign_up'
  resources :posts
  resources :users, exclude: :new
  resources :sessions, exclude: %i[new destroy]

end
