class PostsController < ApplicationController
  def new
  end

  def create
    @post = Post.create(
        title: params[:label],
        body: params[:contents],
        author_id: current_user.id
    )

    redirect_to "/posts/#{@post.id}"
  end

  def all
    @posts = Post.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @post = Post.find params[:id]
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    @post.update(
        title: params[:title],
        body: params[:body]
    )

    redirect_to "/posts/#{@post.id}"
  end

  def favorite
    Favoriting.where(
        user_id: current_user.id,
        post_id: params[:id]
    ).first_or_create

    redirect_to "/posts/#{params[:id]}"
  end

  def unfavorite
    Favoriting.where(
        user_id: current_user.id,
        post_id: params[:id]
    ).delete_all

    redirect_to "/posts/#{params[:id]}"
  end
end