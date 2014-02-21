StartIt::Application.routes.draw do
  
  #match "/evaluations/vote", via:[:post], as: "vote"
  match "/comments/vote", via:[:post], as: "comment_vote"
  match "/questions/vote", via:[:post], as: "question_vote"
  match "/answers/vote", via:[:post], as: "answer_vote"
  match "/ideas/vote", via:[:post], as: "idea_vote"
  match "/solutions/vote", via:[:post], as: "solution_vote"
  
  get "evaluations/show"
  #resources :evaluations
  resources :comments, except: [:index] do
    resources :comments
  end
  resources :questions, except: [:index] do
    resources :comments
  end
  resources :answers, except: [:index] do                     
    resources :comments
  end

  get '/ideas/:idea_id/aspects/:id', to: 'aspects#show', as: 'idea_aspect'
  resources :aspects, except: [:index] do
    resources :solutions
  end
  resources :solutions, except: [:index] do
    resources :comments
  end


  get '/profiles/:id/labs', to: 'profiles#labs'
  resources :profiles, except: [:index]

  get '/ideas/:id/define', to: 'ideas#define'
  get '/ideas/:id/reputation', to: 'ideas#reputation'
  get '/ideas/:id/activity', to: 'ideas#activity'
  resources :ideas do
    member do
      post :vote 
      get :following
    end
  end

  resources :idea_relationships, only: [:create, :destroy]
  
  resources :users do
    member do
      get :following
    end
  end

  # Users and Admins
  devise_for :users
  devise_scope :user do
    get "users/sign_in", :to => "devise/sessions#new"
    get "register", :to => "devise/registrations#new"
    get "login", :to => "devise/sessions#new"
  end
  
  get "profile", :to => "profiles#edit" # We want this to be: get "profile", :to => "profiles#show"


  #Rails Admin interface
  #mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  

  get 'create', to: 'explore#create'
  get 'build', to: 'explore#build'
  get 'buy', to: 'explore#buy'

  get "home/dashboard"
  get "activities/index"
  get "home/index"

  authenticated :user do
    root :to => 'home#dashboard', as: :dashboard
  end
  root to: 'home#index'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
