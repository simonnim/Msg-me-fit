Rails.application.routes.draw do

	
  resources :sessions, only: [:new, :create, :destroy]
  resources :user
  root to: 'user#index'
  get '/logout' => 'sessions#destroy'
  get '/login' => 'sessions#new'
  

end
