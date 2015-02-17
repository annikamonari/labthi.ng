require 'github_api'

class Repo

  def Repo.create(name)
    auth.repos.create(name: name, private: :true, auto_init: :true)
  end

  def Repo.add_user(repo, username)
    auth.repos.collaborators.add(user: USER, repo: repo, username: username)
  end

  def Repo.delete_user(repo, username)
    auth.repos.collaborators.remove(user: USER, repo: repo, username: username)
  end

  private 
    USERNAME = 'alan.vey@gmail.com'
    PASSWORD = 'aNNika9987<3'
    USER     = 'AlanVey'

    def Repo.auth
      Github.new(basic_auth: "#{USERNAME}:#{PASSWORD}")
    end
end