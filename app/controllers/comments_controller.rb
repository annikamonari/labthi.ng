class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :load_commentable
  before_action :auth_user!

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new
    @comment = @commentable.comments.new
    @comment.commentable_id = params[:commentable_id]
    render layout: "form_left"
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    render layout: "form_left"
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        @comment.create_activity :create, owner: (current_user)
        format.html { redirect_to get_question_path(@comment.commentable), notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    @redirect_path = @comment.commentable.try(:question) ||
    @comment.commentable.commentable.try(:question) ||
    @comment.commentable
    respond_to do |format|
      if @comment.update(comment_params)
        @comment.create_activity :update, owner: (current_user)
        format.html { redirect_to @redirect_path, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def load_commentable
      resource, id = request.path.split('/')[1, 2]
      @commentable = resource.singularize.classify.constantize.find_by_id(id)
      @commentable = commentable_from_params unless @commentable
    end

    def commentable_from_params
      commentable_type = params[:commentable_type]
      id = params[:commentable_id]
      @commentable = commentable_type.singularize.classify.constantize.find_by_id(id) unless commentable_type == nil
    end

    def get_question_path(c)
      if c.class.name == 'Comment' then
        return @question_path = get_question_path(c.commentable)
      elsif c.class.name == 'Question' then
        return @question_path = c
      elsif c.class.name == 'Answer' then
        return @question_path = c.question
      elsif c.class.name == 'Aspect' then
        return @question_path = c
      elsif c.class.name == 'Solution' then
        return @question_path = idea_aspect_path(id: c.aspect.id, idea_id: c.idea.id)
      end
    end

    def redirect_path
      @comment.commentable.try(:question) ||
        @comment.commentable.try(:aspect) ||
        @comment.commentable.commentable.try(:question) ||
        @comment.commentable.commentable.try(:aspect) ||
        @comment.commentable
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:brief, :user_id, :commentable_id, :answer_id, :question_id)
    end
end
