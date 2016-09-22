Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
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
