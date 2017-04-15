class SessionsController < ApplicationController
  def new
  end

  def create
    author = Author.find_by_email params[:email]
    if author&.authenticate(params[:password])
      session[:author_id] = author.id
      redirect_to root_path, notice: "Thank you for signing in"
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
