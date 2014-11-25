class PostsController < InheritedResources::Base

  private

    def post_params
      params.require(:post).permit(:idea_build_id, :user_id, :title, :kind, :content, :image, :status, :likes)
    end
end

