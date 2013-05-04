class SessionsController < ApplicationController
  # GET /login
  def new
    render :new, :layout => 'layouts/public'
  end
  
  # POST /login
  def create
    if params[:email_address]
      @user = User.find_by_email_address(params[:email_address])
    
      if params[:password].blank?
        UserMailer.reset_email(@user, request).deliver
        redirect_to login_url, notice: "Your password reset email has been sent!"
      else
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
      
          login = Login.create :user => @user, :session => session[:session_id], :ip_address => request.remote_ip, :user_agent => request.user_agent,
            :referer => request.referer, :logged_in_at => DateTime.now
          session[:login_id] = login.id
      
          redirect_to root_url, :notice => "Welcome to the Bridge City Automotive website admin interface."
        else
          flash.now.alert = "Invalid email or password"
          render "new"
        end
      end
    end
  end

  # DELETE /logout
  def destroy
    session[:user_id] = nil
    
    login = Login.find(session[:login_id])
    
    if login
      login.logged_out_at = DateTime.now
      login.save
    end
    
    session[:login_id] = nil
    
    redirect_to login_url, :notice => "You have successfully logged out. Please do come back soon."
  end
  
  # GET /reset/:code
  def reset
    @user = User.find_by_code(params[:code])
    
    if @user
      render :reset, :layout => 'layouts/public'
    else
      redirect_to :login, :alert => "You're reset code has expired. Please create a new one."
    end
  end
  
  # PUT /reset/:code
  def reset_password
    @user = User.find_by_code(params[:code])
    
    if @user
      if @user.update_attributes(params[:user])
        @user.code = nil
        @user.expires_at = nil
        @user.save
      
        session[:user_id] = @user.id
      
        redirect_to root_url, :notice => "You're password has been reset."
      else
        render :text => @user.name
      end
    else
      redirect_to :login, :alert => "You're reset code has expired. Please create a new one."
    end
  end
  
end