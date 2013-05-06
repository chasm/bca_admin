class LoginsController < ApplicationController
  respond_to :json
  
  before_filter :find_user
  before_filter :find_login, :except => [ :index ]
  
  # GET /users/:user_id/logins
  def index
    @logins = @user.logins
  end

  # GET /users/:user_id/logins/:id
  def show
    head :not_found unless @login
  end

  # DELETE /users/:user_id/logins/:id
  def destroy
    delete_item @login
  end
  
  private
  
  def find_user
    @user = User.find params[:user_id]
    unless @user
      head :not_found
    end
  end
  
  def find_login
    @login = @user.logins.find params[:id]
  end
end
