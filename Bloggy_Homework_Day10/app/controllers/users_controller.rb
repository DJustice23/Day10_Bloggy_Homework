class UsersController < ApplicationController

  def dashboard
    @user_posts = Post.where(author_id: current_user.id)
  end

end