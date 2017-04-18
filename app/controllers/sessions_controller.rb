class SessionsController < ApplicationController
  def new
  end

  def create
    @author = Author.find_by_email params[:email]
    if @author && @author.authenticate(params[:password])
      session[:author_id] = @author.id
      flash[:notice] = "Thank you for signing in"
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid email/password combination!"
      render :new
    end
  end

  def destroy
    session[:author_id] = nil
    flash[:notice] = "Signed Out"
    redirect_to root_path
  end

end
