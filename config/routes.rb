Rails.application.routes.draw do
      resources :users , only: [:index,:show,:create]
      resources :messages , only: [:index,:show,:create]
      resources :chats , only: [:index,:show,:create]
      resources :applications , only: [:index,:show,:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
