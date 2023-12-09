Rails.application.routes.draw do
  namespace :admin do
      resources :authors
      resources :courses
      resources :evaluations
      resources :presentations
      resources :users

      root to: "authors#index"
  end

  resources :courses
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'

  resources :presentations do
    resources :evaluations
  end
  resources :authors
  resources :evaluations
  
  devise_for :users, controllers: {
  registrations: 'users/registrations'
}

  resources :users do
    member do
      put 'change_role'
    end
    collection do
      get 'new_user'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_pages#home"

  # define other roots
  get 'home', to: 'static_pages#home', as: 'home'
  get 'help', to: 'static_pages#help', as: 'help'
  get 'about', to: 'static_pages#about', as: 'about'
  get 'presentations', to: 'presentations#index', as: 'presentations_path'
  get 'evaluations', to: 'evaluations#index', as: 'evaluations_path'
  get 'users', to: 'users#index', as: 'users_path'

end
