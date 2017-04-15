class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    # @post = Post.new(params.require[:post].permit(:title, :text, :user, :screen))
    #   if @post.save
    #     redirect_to posts_path
    #   else
    #     render 'new'
    #   end

    @author = Author.new author_params
    if @author.save
      session[:author_id] = @author.id
      flash[:notice] = "Thank you for signing up!"
      redirect_to blog_index_path
    else
      flash[:alert] = "Something went wrong!"
      render :new
    end
  end

  private

  def author_params
    params.require(:author).permit([:name, :avatar, :about, :email, :password, :password_confirmation])
  end
end
