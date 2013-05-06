class LocationsController < ApplicationController
  respond_to :json
  
  before_filter :find_credit_application
  before_filter :find_location, :except => [ :index ]
  
  # GET /credit_applications/:credit_application_id/locations
  def index
    @locations = @credit_application.locations
  end

  # GET /credit_applications/:credit_application_id/locations/:id
  def show
    head :not_found unless @location
  end

  # PUT /credit_applications/:credit_application_id/locations/:id
  def update
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
    delete_item @location
  end
  
  private
  
  def find_credit_application
    @credit_application = CreditApplication.find params[:credit_application_id]
    unless @credit_application
      head :not_found
    end
  end

  def find_location
    @location = @credit_application.locations.find params[:id]
  end
end
