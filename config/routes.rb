Rails.application.routes.draw do
  resources :courses
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'

  resources :presentations do
    resources :evaluations
  end
  resources :authors
  resources :evaluations
  resources :surveys
  
  devise_for :users, controllers: {
  registrations: 'users/registrations'
}

  resources :users do
    put 'change_role', on: :member
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
