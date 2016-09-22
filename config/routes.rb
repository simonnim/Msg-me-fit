Rails.application.routes.draw do

	
  resources :sessions, only: [:new, :create, :destroy]
  resources :user do
  	resources :meals
  	resources :calendar
  	resources :workouts
    resources :exerciselist
  end

  root to: 'user#index'
  get '/logout' => 'sessions#destroy'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'


end
