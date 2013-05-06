class PhoneNumbersController < ApplicationController
  respond_to :json

  before_filter :find_user
  before_filter :find_phone_number, :except => [ :index ]

  # GET /users/:user_id/phone_numbers
  def index
    @phone_numbers = @user.phone_numbers
  end

  # GET /users/:user_id/phone_numbers/:id
  def show
    head :not_found unless @phone_number
  end

  # PUT /users/:user_id/phone_numbers/:id
  def update
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
    delete_item @phone_number
  end

  private

  def find_user
    @user = User.find params[:user_id]
    unless @user
      head :not_found
    end
  end

  def find_phone_number
    @phone_number = @user.phone_numbers.find params[:id]
  end
end
