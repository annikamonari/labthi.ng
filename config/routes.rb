StartIt::Application.routes.draw do
  
  get "activities/index"
  resources :comments

  resources :solutions

  resources :idea_tags

  resources :aspects
  resources :ideas

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  

  get "home/index"

  devise_for :users

  devise_scope :user do
    get "register", :to => "devise/registrations#new"
    get "login", :to => "devise/sessions#new"
    get "profile", :to => "devise/registrations#edit"
  end



  root to: 'home#index'
  
end
