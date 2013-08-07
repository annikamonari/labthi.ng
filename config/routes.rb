StartIt::Application.routes.draw do
  
  get "activities/index"
  resources :comments
  resources :solutions
  resources :idea_tags
  resources :aspects
  resources :ideas

  # Users and Admins
  devise_for :users do
    get "users/sign_in", :to => "devise/sessions#new"
  end
  resources :users, :only => [:show]
  devise_for :admins


  devise_scope :user do
    get "register", :to => "devise/registrations#new"
    get "login", :to => "devise/sessions#new"
  end

  #Rails Admin interface
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  
  get "home/index"
  root to: 'home#index'
  
end
