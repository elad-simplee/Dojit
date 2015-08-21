class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment was not saved. Please try again"
      render :new
    end
  end

  def post_url (params)
    @post = Post.find(params[:post_id])
    @post.url
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
