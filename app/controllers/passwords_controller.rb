class PasswordsController < Devise::PasswordsController
  
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
    else
      redirect_to :back, notice: 'Please enter a valid email'
    end
  end

  protected
    def after_sending_reset_password_instructions_path_for(resource_name)
      '/'
    end
end