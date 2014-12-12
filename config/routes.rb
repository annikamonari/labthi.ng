StartIt::Application.routes.draw do

  resources :votes

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
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
  resources :questions, except: [:index, :create, :update] do
    resources :comments
  end
  get '/ideas/:id/questions/new', to: 'ideas#new_question', as: 'idea_new_question'
  get '/ideas/:id/questions/:question_id', to: 'ideas#edit_question', as: 'idea_edit_question'
  post '/ideas/:id/questions/', to: 'questions#create', as: 'create_question'
  patch '/ideas/:id/questions/:question_id', to: 'questions#update', as: 'update_question'
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


  get '/profiles/:id/skills', to: 'profiles#skills'
  resources :profiles, except: [:index, :new, :create]

  # TODO: Nest under idea
  get "/ideas/:idea_id/parts/:id/edit", to: "parts#edit", as: "edit_part"
  get "/ideas/:idea_id/parts/:id/help_content", to: "parts#help_content", as: "part_help_content"
  get "/ideas/:idea_id/parts/:id/admin_tasks", to: "parts#admin_tasks", as: "part_admin_tasks"
  put "/ideas/:idea_id/parts/:id/update", to: "parts#update", as: "update_part"
  put "/ideas/:idea_id/parts/:id/update_image", to: "parts#update_image", as: "update_image_part"
  put "/ideas/:idea_id/parts/:id/add_user_to_repo", to: "parts#add_user_to_repo", as: "add_user_to_repo"
  put "/ideas/:idea_id/parts/:id/unstart_part", to: "parts#unstart_part", as: "unstart_part"
  post "/ideas/:idea_id/parts/:id/update_status", to: "parts#update_status", as: "update_status"
  delete "/ideas/:idea_id/parts/:id/clear", to: "parts#clear", as: "clear_part"
  delete "/ideas/:idea_id/parts/:id/edit/remove_upload/:upload_id", to:"part_upload#destroy", as: "destroy_upload"
  delete "/ideas/:idea_id/parts/:id/remove_user", to: "parts#remove_user_from_repo", as: "remove_user_from_repo"
  
  get '/ideas/:idea_id/parts/:id/admin_tasks/new', to: 'admin_tasks#new', as: 'new_admin_task'
  post '/ideas/:idea_id/parts/:part_id/admin_tasks/:id/update_status', to: 'admin_tasks#update_status', as: 'update_admin_task'
  post '/ideas/:idea_id/parts/:id/admin_tasks/new', to: 'admin_tasks#create', as: 'create_admin_task'


  post '/ideas/:idea_id/idea_build/:kind/:kind_id/comments/create', to: 'task_comments#create', as: 'create_task_comment'

  get "/ideas/:idea_id/build", to: "idea_builds#overview", as: 'idea_build'
  get "/ideas/:idea_id/overview/news_feed", to: 'idea_builds#news_feed', as: 'idea_build_feed'
  get "/ideas/:idea_id/overview/team_build", to: 'idea_builds#team_build', as: 'idea_build_team_build'
  get "/ideas/:idea_id/discussion", to: 'idea_builds#discussion', as: 'idea_build_discussion'
  post "/ideas/:idea_id/overview/news_feed/create_post", to: 'posts#create', as: 'create_post'
  post "/ideas/:idea_id/overview/team_build/create_proposal", to: 'posts#create_proposal', as: 'create_proposal'
  post "/ideas/:idea_id/overview/team_build/:post_id/close_proposal", to: 'posts#close_proposal', as: 'close_proposal'
  post "/ideas/:idea_id/overview/team_build/:post_id/apply", to: 'team_applications#create', as: 'create_team_application'
  get "/ideas/:idea_id/overview/team_build/proposals/:post_id/", to: 'posts#show', as: 'post'

  get "/ideas/:idea_id/build/components", to: "idea_builds#components", as: 'idea_build_components'
  get '/ideas/:id/define', to: 'ideas#define'
  get '/ideas/:id/reputation', to: 'ideas#reputation'
  get '/ideas/:id/activity', to: 'ideas#activity'
  get '/ideas/:id/build', to: 'ideas#build'
  post '/ideas/:idea_build_id/team_applications/:team_application_id', to: 'team_memberships#create', as: 'create_team_member'

  post 'ideas/:id/increase_create_length', to: 'ideas#increase_create_length', as: 'increase_create_length'
  resources :ideas do
    member do
      post :vote 
      get :followers

    end
    resources :idea_build, only: [:edit, :clear, :update]
  end

  resources :idea_relationships, only: [:create, :destroy]

  # Users and Admins
  devise_for :users, controllers: { registrations: 'registrations', 
                                    passwords: 'passwords', 
                                    sessions: 'sessions' }
  devise_scope :user do
    get "users/sign_in", :to => "devise/sessions#new"
    get "register", :to => "devise/registrations#new"
    get "login", :to => "devise/sessions#new"
  end
  
  get "profile", :to => "profiles#show" # We want this to be: get "profile", :to => "profiles#show"


  #Rails Admin interface
  #mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  

  get 'create', to: 'explore#create'
  get 'build', to: 'explore#build'
  get 'buy', to: 'explore#buy'
  get 'documentation', to: 'home#documentation'

  post '/buy/:id/buy', to: 'buy_phase_vote#buy_vote', as: 'buy_vote'
  post '/buy/:id/use', to: 'buy_phase_vote#use_vote', as: 'use_vote'

  #get "home/dashboard"
  get "activities/index"
  get "home/index"
  get "/followed_ideas", to: 'home#followed_ideas', as: 'followed_ideas'

  authenticated :user do
    root :to => 'home#dashboard', as: :dashboard
  end
  root to: 'home#index'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
