class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def author_signed_in?
    session[:author_id].present?
  end
  helper_method :author_signed_in?

  def current_author
    @current_author ||= Author.find_by_id session[:author_id] if author_signed_in?
  end
  helper_method :current_author

  def authenticate_author!
    if !author_signed_in?
      redirect_to new_session_path, notice: "You must be signed in!"
    end
  end


end
