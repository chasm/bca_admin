class UsersController < ApplicationController
  respond_to :json
  
  before_filter :find_user, :except => [ :index ]
  
  # GET /users
  def index
    @users = User.all
  end

  # GET /users/:id
  def show
    head :not_found unless @user
  end

  # PUT /users/:id
  def update
    if @user
      if @user.update_attributes(params[:user])
        head :no_content
      else
        render :errors, status: :unprocessable_entity 
      end
    else
      @user = User.new(params[:user])
      @user.id = params[:id]
      
      if @user.save
        render :show
      else
        render :errors, status: :unprocessable_entity 
      end
    end
  end

  # DELETE /users/:id
  def destroy
    delete_item @user
  end
  
  private
  
  def find_user
    @user = User.find params[:id]
  end
end
