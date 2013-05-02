class LoginsController < ApplicationController
  # GET /users/:user_id/logins
  def index
    @user = User.find(params[:user_id])
    @logins = @user.logins
    
    render :json => @logins
  end

  # GET /users/:user_id/logins/:id
  def show
    @login = Login.find params[:id]
    
    render :json => @login
  end

  # DELETE /users/:user_id/logins/:id
  def destroy
    @login = Login.find params[:id]
    @login.destroy
    
    head :no_content
  end
end
