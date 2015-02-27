class SessionsController < Devise::SessionsController
  
  def new
    redirect_to '/', 
    notice: 'Please sign in or sign up to browse Labthi.ng!'
  end

end