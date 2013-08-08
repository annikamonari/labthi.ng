StartIt::Application.routes.draw do
  
  get "activities/index"
  resources :comments
  resources :solutions
  resources :idea_tags
  resources :aspects
  resources :ideas

  # Users and Admins
  devise_for :users

  devise_scope :user do
    get "users/sign_in", :to => "devise/sessions#new"
    get "register", :to => "devise/registrations#new"
    get "login", :to => "devise/sessions#new"
    get "profile", :to => "devise/registrations#edit"
  end
  
  #resources :users, :only => [:show]
  devise_for :admins



  #Rails Admin interface
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  
  get "home/index"
  root to: 'home#index'
  
end
