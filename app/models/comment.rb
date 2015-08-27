class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  after_create :send_favorite_emails

  private

  def send_favorite_emails
    post.favorites.each do |fav|
      FavoriteMailer.new_comment(fav.user, post, self).deliver
    end
  end
end
