Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  get 'about', to: 'pages#about'

  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  post 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'


  resources :articles
end
