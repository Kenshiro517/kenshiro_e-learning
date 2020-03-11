Rails.application.routes.draw do
  
  
  root 'static_pages#home'

  get 'static_pages/about'
  get '/signup', to: 'users#new'
  get '/login',   to: 'sessions#new'
  post  '/login',   to: 'sessions#new'
  delete '/logout',  to: 'sessions#destroy'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
end
