StartIt::Application.routes.draw do

# =============================================================================
# Application Wide ============================================================
# =============================================================================
  root to: 'home#index'

  # User ======================================================================
  devise_for :users, controllers: { registrations: 'registrations', passwords: 'passwords', sessions: 'sessions' }
  devise_scope :user do
    get "users/sign_in", :to => "devise/sessions#new"
    get "register", :to => "devise/registrations#new"
    get "login", :to => "devise/sessions#new"
  end

  # Nav bar ===================================================================
  get 'create', to: 'explore#create'
  get 'build', to: 'explore#build'
  get 'buy', to: 'explore#buy'

# =============================================================================
# Phase 1 =====================================================================
# =============================================================================

  match "/comments/vote", via:[:post], as: "comment_vote"
  match "/questions/vote", via:[:post], as: "question_vote"
  match "/answers/vote", via:[:post], as: "answer_vote"
  match "/ideas/vote", via:[:post], as: "idea_vote"
  match "/solutions/vote", via:[:post], as: "solution_vote"
  
  get "evaluations/show"

  get "/dashboard", to: 'home#dashboard', as: 'dashboard'

  resources :notifications, only: [:index, :destroy]
  resources :profiles, except: [:index, :new, :create]
  resources :idea_relationships, only: [:create, :destroy]
  resources :comments, only: [:show]
  resources :questions, except: [:index, :create, :update]
  resources :answers, except: [:index, :create]
  resources :aspects, except: [:index, :show, :create, :new] do
    resources :solutions, except: [:index, :edit, :update, :create, :show]
  end

  resources :ideas do
    member do
      post :vote 
      get :followers
    end
    resources :idea_build, only: [:edit, :clear, :update] # This is phase 2
  end

  get '/solutions/:id', to: 'solutions#show', as: 'solution'
  get '/ideas/:idea_id/aspects/:id/solution/create', to: 'solutions#create', as: 'create_solution'

  get '/ideas/:id/questions/new', to: 'ideas#new_question', as: 'idea_new_question'
  get '/ideas/:id/questions/:question_id', to: 'ideas#edit_question', as: 'idea_edit_question'
  post '/ideas/:id/questions/', to: 'questions#create', as: 'create_question'
  patch '/ideas/:id/questions/:question_id', to: 'questions#update', as: 'update_question'
  post '/ideas/:id/questions/:question_id', to: 'answers#create', as: 'create_answer'
  post "/ideas/:idea_id/:commentable_type/:commentable_id", to: 'comments#create', as: 'create_comment'

  get '/ideas/:idea_id/aspects/:id', to: 'aspects#show', as: 'idea_aspect'

  get '/ideas/:id/define', to: 'ideas#define'
  get '/ideas/:id/reputation', to: 'ideas#reputation'
  get '/ideas/:id/activity', to: 'ideas#activity'

  get '/profiles/:id/skills', to: 'profiles#skills'
  get "profile", :to => "profiles#show"
  
  get "activities/index"
  get "/followed_ideas", to: 'home#followed_ideas', as: 'followed_ideas'

  post 'ideas/:id/increase_create_length', to: 'ideas#increase_create_length', as: 'increase_create_length'

# =============================================================================
# Phase 2 =====================================================================
# =============================================================================

=begin
  get 'build_needs_team', to: 'explore#needs_team'
  get 'documentation', to: 'home#documentation'

  get "/ideas/:idea_id/parts/:id/edit", to: "parts#edit", as: "edit_part"
  get "/ideas/:idea_id/parts/:id/help_content", to: "parts#help_content", as: "part_help_content"
  get '/download', to: 'parts#download', as: 'download'
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
  get '/ideas/:idea_id/:kind/:kind_id/discussion', to: 'chats#new', as: 'new_chat'
  post '/ideas/:idea_id/:kind/:kind_id/create_chat', to: 'chats#create', as: 'create_chat'
  get '/ideas/:idea_id/:kind/:kind_id/chats', to: 'chats#index', as: 'chats'

  get "/ideas/:idea_id/build/components", to: "idea_builds#components", as: 'idea_build_components'

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  post 'like/:model_name/:model_id/:user_id', to: 'likes#like', as: 'like'
  delete 'like/:model_name/:model_id/:user_id', to: 'likes#unlike', as: 'unlike'

  post '/strike/:user_id/:idea_build_id/:voter_id', to: 'strike#create', as: 'strike'  

  post '/ideas/:idea_build_id/team_applications/:team_application_id', to: 'team_memberships#create', as: 'create_team_member'

# =============================================================================
# Phase 3 =====================================================================
# =============================================================================

  post '/buy/:id/buy', to: 'buy_phase_vote#buy_vote', as: 'buy_vote'
  post '/buy/:id/use', to: 'buy_phase_vote#use_vote', as: 'use_vote'
=end

end
