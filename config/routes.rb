Rails.application.routes.draw do
  devise_for :users

  #get 'events/index'
  resources :events
  resources :invitations, only: [:create]
  get 'users/:id' => 'users#show', as: 'user'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'events#index'

end
