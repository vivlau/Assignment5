class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_author!
    unless author_signed_in?
      flash[:notice] = "Please sign in"
        redirect_to new_session_path
      end
    end
  helper_method :authenticate_author!

  def author_signed_in?
    session[:author_id].present?
  end
  helper_method :author_signed_in?

  def current_author
    @current_author ||= Author.find_by_id session[:author_id] if author_signed_in?
  end
  helper_method :current_author

end
