class CommentsController < ApplicationController
  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
  	@comment.save

    if request.env["HTTP_REFERER"].present?
  	  redirect_to :back
    else
      redirect_to :root
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:event_id, :user_id, :body)
    end
end
