class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
  end

  def create
    @post = Post.new(params[:post])

    @post.save
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :likes, :image)
  end

end
