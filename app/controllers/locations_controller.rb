class LocationsController < ApplicationController
  respond_to :json
  
  before_filter :get_credit_application
  
  # GET /credit_applications/:credit_application_id/locations
  def index
    @locations = @credit_application.locations

    render json: @locations
  end

  # GET /credit_applications/:credit_application_id/locations/:id
  def show
    @location = @credit_application.locations.find(params[:id])
    
    if @location
      render json: @location
    else
      head :not_found
    end
  end

  # PUT /credit_applications/:credit_application_id/locations/:id
  def update
    @location = @credit_application.locations.find(params[:id])

    if @location
      if @location.update_attributes(params[:location])
        head :no_content
      else
        render json: @location.errors, status: :unprocessable_entity
      end
    else
      @location = Location.new(params[:location])
      @location.id = params[:id]
      @credit_application.locations << @location
      if @credit_application.save
        render json: @location
      else
        render json: @location.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /credit_applications/:credit_application_id/locations/:id
  def destroy
    @location = @credit_application.locations.find(params[:id])
    @location.destroy

    head :no_content
  end
  
  private
  
  def get_credit_application
    @credit_application = CreditApplication.find(params[:credit_application_id])
  end
end
