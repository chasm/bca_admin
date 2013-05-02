class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all

    render json: @users, :except => [ :salt, :hash ]
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])

    render json: @user
  end

  # PUT /users/:id
  def update
    @user = User.find(params[:id])
    
    if @user
      if @user.update_attributes(params[:user])
        head :no_content
      else
        render json: @user.errors, status: :unprocessable_entity 
      end
    else
      @user = User.new(params[:user])
      @user.id = params[:id]
      
      if @user.save
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity 
      end
    end
  end

  # DELETE /users/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    head :no_content
  end
end
