class SessionsController < Devise::SessionsController
  
  def new
    redirect_to '/', 
    notice: 'Your details do not match to a user in our system. Please try again or sign up.'
  end

end