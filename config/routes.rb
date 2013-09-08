StartIt::Application.routes.draw do
  
  get 'explore', to: 'explore#index'
  #get "profile/show"
  #get "profile/edit"
  get "activities/index"

  resources :comments do
    resources :comments
  end
  resources :questions do                                                      
    resources :comments
  end
  resources :solutions do                                                      
    resources :comments
  end
  resources :aspects
  resources :profiles

  get '/ideas/:id/define', to: 'ideas#define'
  get '/ideas/:id/reputation', to: 'ideas#reputation'
  get '/ideas/:id/activity', to: 'ideas#activity'
  resources :ideas
  
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
