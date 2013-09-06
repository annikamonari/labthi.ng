StartIt::Application.routes.draw do
  
  resources :questions

  get 'explore', to: 'explore#index'
  #get "profile/show"
  #get "profile/edit"
  get "activities/index"
  resources :comments
  resources :solutions
  resources :aspects
  resources :ideas
  resources :profiles
  
  get "profile", :to => "profiles#edit" # We want this to be: get "profile", :to => "profiles#show"

  # Users and Admins
  devise_for :users

  devise_scope :user do
    get "users/sign_in", :to => "devise/sessions#new"
    get "register", :to => "devise/registrations#new"
    get "login", :to => "devise/sessions#new"
  end
  

  #resources :users, :only => [:show]
  devise_for :admins



  #Rails Admin interface
  #mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  
  get "home/index"
  root to: 'home#index'
  
end
