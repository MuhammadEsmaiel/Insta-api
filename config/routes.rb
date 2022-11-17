Rails.application.routes.draw do
  resources :chats
  get 'session/new'
      resources :users
      resources :messages 
      resources :chats 
      resources :applications 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #, only: [:index,:show,:create]
  # Defines the root path route ("/")
  # root "articles#index"
end
