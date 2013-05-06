class CreditApplicationsController < ApplicationController
  respond_to :json
  
  # GET /credit_applications
  def index
    @credit_applications = CreditApplication.all
  end

  # GET /credit_applications/:id
  def show
    @credit_application = CreditApplication.find(params[:id])

    render json: @credit_application
  end

  # PUT /credit_applications/:id
  def update
    @credit_application = CreditApplication.find(params[:id])
    
    if @credit_application
      if @credit_application.update_attributes(params[:credit_application])
        head :no_content
      else
        render json: @credit_application.errors, status: :unprocessable_entity 
      end
    else
      @credit_application = CreditApplication.new(params[:credit_application])
      @credit_application.id = params[:id]
      
      if @credit_application.save
        render json: @credit_application
      else
        render json: @credit_application.errors, status: :unprocessable_entity 
      end
    end
  end

  # DELETE /credit_applications/:id
  def destroy
    @credit_application = CreditApplication.find(params[:id])
    @credit_application.destroy

    head :no_content
  end
end
