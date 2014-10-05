class PartsController < ApplicationController
  before_action :set_part
  before_action :auth_user!

  def edit
    @users = get_repo_users if @part.name == 'Prototype'
  end

  def clear
    @part.value = nil
    @part.user = nil
    @part.save

    if @part.is_business_plan or @part.is_plan?
      @part.part_uploads.each { |u| u.delete }
    end

    if @part.name == 'Prototype'
      delete_repo_users
      delete_repo_invites
    end

    redirect_to idea_build_path(@part.idea)
  end

  def add_user_to_repo
    if post_user_to_bitbucket(params[:part][:value]) == 200
      redirect_to :back, notice: "The email invitation was successfully sent."
    else
      redirect_to :back, notice: "An error occured adding the user."
    end
  end

  def remove_user_from_repo
    user = params[:user]

    delete_repo_users(user)

    redirect_to :back, notice: "The user was successfully removed."
  end

  def update_image
    @upload = nil
    if params[:part_upload]
      @upload = PartUpload.new
      @upload.image = params[:part_upload]['image']
      @upload.part = @part
    end

    respond_to do |format|
      if (@upload ? @upload.save : true)
        format.html {redirect_to :back, notice: 'Part was successfully updated.'}
      else
        format.html {redirect_to :back, notice: 'Part was not updated due to an error.'}
      end
    end
  end

  def update
    respond_to do |format|
      if @part.update(part_params)
        format.html {redirect_to :back, notice: 'Part was successfully updated.'}
      else
        format.html {redirect_to :back, notice: 'Part was not updated due to an error.'}
      end
    end
  end

  # Used for status setting
  def update_status
    case @part.status
    when 'Unstarted'
      @part.status = 'Started'
      @part.user   = current_user
      post_user_to_bitbucket(current_user.email) if @part.name == 'Prototype'
    when 'Started'
      @part.status = 'Finished'
    when 'Finished' 
      @part.status = 'In Review'
    when 'In Review'
      @part.status = 'Accepted'
    end
    @part.save
    redirect_to :back
  end
  
  # Used for status setting
  def unstart_part
    @part.status = 'Unstarted'
    @part.user   = nil
    @part.save

    if @part.name == 'Prototype'
      delete_repo_users 
      delete_repo_invites
    end
    redirect_to idea_build_path(@part.idea), notice: 'You successfully unstarted the part.'
  end

  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit(:value, :email, :user, :bootsy_image_gallery_id, part_upload_attributes: [:image])
  end

  private

    def post_user_to_bitbucket(email)
      uri  = "https://bitbucket.org/api/1.0/invitations/LabthingPrototypes/#{get_repo_name}/#{email}"
      form = Curl::PostField.content("permission", "write")
      c    = initialise_curl(uri)

      c.http_post(uri, form)

      c.response_code
    end

    def delete_repo_users(username = nil)
      uri = "https://bitbucket.org/api/1.0/privileges/LabthingPrototypes/#{get_repo_name}/#{username}"
      c   = initialise_curl(uri)

      c.http_delete

      c.response_code
    end

    def get_repo_users
      users = Array.new
      uri   = "https://bitbucket.org/api/1.0/privileges/LabthingPrototypes/#{get_repo_name}/"
      c     = initialise_curl(uri)
      
      c.perform

      c.body.scan(/(user.{5}username.{4})([\w-]+)/).each {|s| users << s[1]}
      users
    end

    def delete_repo_invites
      emails = Array.new
      uri    = "https://bitbucket.org/api/1.0/invitations/LabthingPrototypes/#{get_repo_name}/"
      c      = initialise_curl(uri)
      
      c.perform

      c.body.scan(/(email\": \")([\w-@]+\.[a-z]{2,3})/).each {|email| emails << email[1] }
      emails.each { |email| delete_repo_invite(email)}
    end

    def delete_repo_invite(email = nil)
      uri = "https://bitbucket.org/api/1.0/invitations/LabthingPrototypes/#{get_repo_name}/#{email}"
      c   = initialise_curl(uri)

      c.http_delete

      c.response_code
    end

    def initialise_curl(uri)
      c                 = Curl::Easy.new(uri)
      c.http_auth_types = :basic
      c.username        = 'LabthingPrototypes'
      c.password        = 'banana123'
      c
    end

    def get_repo_name
      idea = @part.idea
      "#{idea.title.downcase}-#{idea.id.to_s}".sub(' ', '-')
    end

end
