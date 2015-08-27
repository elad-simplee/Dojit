class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.build(post: @post)

    authorize @favorite

    if @favorite.save
      flash[:notice] = "You Favorited this post."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Favoriting post failed, please try agian"
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = @post.favorites.find(params[:id])

    authorize @favorite

    if @favorite.destroy
      flash[:notice] = "Post removed from favorites."      
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Unfavoriting post failed, please try agian"
      redirect_to [@post.topic, @post]
    end
  end
end
