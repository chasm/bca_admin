class PhoneNumbersController < ApplicationController
  before_filter :get_user
  
  # GET /users/:user_id/phone_numbers
  def index
    @phone_numbers = @user.phone_numbers

    render json: @phone_numbers
  end

  # GET /users/:user_id/phone_numbers/:id
  def show
    @phone_number = @user.phone_numbers.find(params[:id])
    
    if @phone_number
      render json: @phone_number
    else
      head :not_found
    end
  end

  # PUT /users/:user_id/phone_numbers/:id
  def update
    @phone_number = @user.phone_numbers.find(params[:id])

    if @phone_number
      if @phone_number.update_attributes(params[:phone_number])
        head :no_content
      else
        render json: @phone_number.errors, status: :unprocessable_entity
      end
    else
      @phone_number = PhoneNumber.new(params[:phone_number])
      @phone_number.id = params[:id]
      @user.phone_numbers << @phone_number
      if @user.save
        render json: @phone_number
      else
        render json: @phone_number.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /users/:user_id/phone_numbers/:id
  def destroy
    @phone_number = @user.phone_numbers.find(params[:id])
    @phone_number.destroy

    head :no_content
  end
  
  private
  
  def get_user
    @user = User.find(params[:user_id])
  end
end
