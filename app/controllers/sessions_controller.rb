class SessionsController < Devise::SessionsController
  
  def new
    redirect_to '/', 
    notice: 'Please sign in correctly or sign up to browse Labthi.ng!'
  end

  def edit
    super
  end

end