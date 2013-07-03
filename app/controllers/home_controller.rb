class HomeController < ApplicationController
  #before_filter :authenticate_user!
  def index
    greet_user
    #new_idea
  end

  def greet_user
    if(user_signed_in?)
      puts "Ohai!, #{current_user.email}"
    end
  end

  def new_idea
    @idea = Idea.new
    render partial: "ideas/form"
  end
end
