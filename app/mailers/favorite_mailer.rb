class FavoriteMailer < ApplicationMailer
  default from: "elad.c@simplee.com"

  def new_comment (user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@dojit.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@dojit.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@dojit.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

end
