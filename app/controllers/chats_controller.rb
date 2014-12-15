class ChatsController < ApplicationController

  def index
    @chats = Chat.where(kind: params[:kind], kind_id: params[:kind_id]).where('id > ?', params[:after_id].to_i).order('created_at DESC').includes(:user).reverse
  end

  def new
    @url = request.fullpath.sub('new_chat', 'chats')
    @chat = Chat.new
    @chats = Chat.where(kind: params[:kind], kind_id: params[:kind_id]).order('created_at DESC').includes(:user).reverse
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
end

