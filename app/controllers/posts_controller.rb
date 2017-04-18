class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :unlike]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comment = @post.comments.build
    # session[:voting_id] = request.remote_ip
    # upvote = Session.find_or_create_by(ip: session[:voting_id])
    # @post.upvote
    # redirect_to :back
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update post_params
      redirect_to post_path(@post), notice: "Post Updated"
    else
      render :edit
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "Post Created"
    else
      render :new
    end
  end

  def like
    # @post.liked
    # respond_to do |format|
    #   format.html { redirect_to :back }
    #   format.js
    # end
    @post = Post.find (params[:id])
    session[:voting_id] = request.remote_ip
    upvote = Session.find_or_create_by(ip: session[:voting_id])
    @post.upvote
    redirect_to :back
  end

  def unlike
    # @post.unliked
    # respond_to do |format|
    #   format.html { redirect_to :back }
    #   format.js
    # end
    @post = Post.find (params[:id])
    session[:voting_id] = request.remote_ip
    downvote = Session.find_or_create_by(ip: session[:voting_id])
    @post.downvote
    redirect_to :back
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to root_path, notice: "Post Deleted"
  end

  def set_post
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :author_id, :body, :likes, :image)
  end

end
