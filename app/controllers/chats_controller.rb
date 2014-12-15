class ChatsController < ApplicationController
  before_action :set_idea
  before_action :set_idea_build
  #TODO: add security for only team members

  def index
    @chats = Chat.where(kind: params[:kind], kind_id: params[:kind_id]).where('id > ?', params[:after_id].to_i).order('created_at DESC').includes(:user).reverse
  end

  def new
    @url = request.fullpath.sub('discussion', 'chats')
    @chat = Chat.new
    @chats = Chat.where(kind: params[:kind], kind_id: params[:kind_id]).order('created_at DESC').includes(:user).last(100).reverse
    @users = TeamMembership.where(idea_build_id: @idea_build.id).includes(:user).map { |tm| [tm.user.mention_name.sub('@', '')] }

    if params[:kind] == 'part'
      @part = Part.find(params[:kind_id])
      render layout: 'sidebar_part'
    end
  end

  def create
    @chat = Chat.new(chat_params)
    @url = request.fullpath.sub('create_chat', 'chats')
    @chat.kind = params[:kind]
    @chat.kind_id = params[:kind_id]
    @chat.user = current_user
    respond_to do |format|
      if @chat.save
        format.html { redirect_to :back, notice: 'Comment successfully created.'}
        format.js
      else
        format.html { redirect_to :back, notice: 'There was an error posting the comment.'}
        format.js {render nothing: true}
      end
    end
  end

  private

    def chat_params
      params.require(:chat).permit(:body)
    end

    def set_idea
      @idea = Idea.find(params[:idea_id])
    end

    def set_idea_build
      @idea_build = @idea.idea_build
    end

    def get_chats_kind(chats)
      chats.first.kind
    end
end

