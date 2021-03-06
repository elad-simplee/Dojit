class VotesController < ApplicationController
  before_action :load_post_and_vote  

  def up_vote
    update_vote!(1)
    redirect_to :back
  end

  def down_vote
    update_vote!(-1)
    redirect_to :back
  end

  private 

  def load_post_and_vote
    @post = Post.find(params[:post_id])

    @vote = @post.votes.where(user_id: current_user.id).first
  end

  def update_vote! (v)

    if @vote
      authorize @vote, :update?
      @vote.update_attribute(:value, v)
    else
      @vote = current_user.votes.create(value: v, post: @post)
      authorize @vote, :create?
      @vote.save
    end
  end

end