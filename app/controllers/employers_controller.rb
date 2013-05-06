class EmployersController < ApplicationController
  respond_to :json
  
  before_filter :get_credit_application
  
  # GET /credit_applications/:credit_application_id/employers
  def index
    @employers = @credit_application.employers

    render json: @employers
  end

  # GET /credit_applications/:credit_application_id/employers/:id
  def show
    @employer = @credit_application.employers.find(params[:id])
    
    if @employer
      render json: @employer
    else
      head :not_found
    end
  end

  # PUT /credit_applications/:credit_application_id/employers/:id
  def update
    @employer = @credit_application.employers.find(params[:id])

    if @employer
      if @employer.update_attributes(params[:employer])
        head :no_content
      else
        render json: @employer.errors, status: :unprocessable_entity
      end
    else
      @employer = Employer.new(params[:employer])
      @employer.id = params[:id]
      @credit_application.employers << @employer
      if @credit_application.save
        render json: @employer
      else
        render json: @employer.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /credit_applications/:credit_application_id/employers/:id
  def destroy
    @employer = @credit_application.employers.find(params[:id])
    @employer.destroy

    head :no_content
  end
  
  private
  
  def get_credit_application
    @credit_application = CreditApplication.find(params[:credit_application_id])
  end
end
