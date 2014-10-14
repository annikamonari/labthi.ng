class Bitbucket

  def initialize(name, id)
    @name = "#{name.downcase}-#{id.to_s}".sub(' ', '-')
  end

  def create
    form1 = Curl::PostField.content("name", @name)
    form2 = Curl::PostField.content("is_private", 'true')
    c     = initialise_curl(CREATE_REPO)

    c.http_post(CREATE_REPO, form1, form2)
    c.response_code
  end

  def post_user(email)
    post_to = "#{INVITATIONS}/#{@name}/#{email}"
    form    = Curl::PostField.content("permission", "write")
    c       = initialise_curl(post_to)

    c.http_post(post_to, form)
    c.response_code
  end

  def delete_users(username = nil)
    c = initialise_curl("#{PRIVILEGES}/#{@name}/#{username}")

    c.http_delete
    get_repo_invites.each { |i| delete_repo_invites(i) }

    c.response_code
  end

  def get_users
    get_repo_users.reverse + get_repo_invites
  end

  private

    API            = "https://bitbucket.org/api/1.0"
    CREATE_REPO    = "#{API}/repositories"
    PRIVILEGES     = "#{API}/privileges/LabthingPrototypes"
    INVITATIONS    = "#{API}/invitations/LabthingPrototypes"
    
    def initialise_curl(uri)
      c                 = Curl::Easy.new(uri)
      c.http_auth_types = :basic
      c.username        = 'LabthingPrototypes'
      c.password        = 'banana123'
      c
    end

    def get_repo_users
      users = Array.new
      c     = initialise_curl("#{PRIVILEGES}/#{@name}")

      c.perform
      c.body.scan(/(user.{5}username.{4})([\w-]+)/).each {|s| users << s[1]}

      users
    end

    def get_repo_invites
      emails      = Array.new
      c           = initialise_curl("#{INVITATIONS}/#{@name}")

      c.perform
      c.body.scan(/(email\": \")([\w-@]+\.[a-z]{2,3})/).each { |e| emails << e[1] }

      emails
    end

    def delete_repo_invites(email)
      c = initialise_curl("#{INVITATIONS}/#{@name}/#{email}")

      c.http_delete
      c.response_code
    end

end