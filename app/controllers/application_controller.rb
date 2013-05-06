class ApplicationController < ActionController::Base
  # protect_from_forgery
  
  private
  
  def get_uuids(count)
    (0...count).to_a.map do
      SecureRandom.uuid
    end
  end
  helper_method :get_uuids

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
  
  def delete_item(item)
    if item
      item.destroy
      head :no_content
    else
      head :not_found
    end
  end
end
