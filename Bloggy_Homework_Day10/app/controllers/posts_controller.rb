class PostsController < ApplicationController
  def new
  end

  def create
    @post = Post.create(
        title: params[:label],
        body: params[:contents]
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
end