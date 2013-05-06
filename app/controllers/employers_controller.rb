class EmployersController < ApplicationController
  respond_to :json
  
  before_filter :find_credit_application
  before_filter :find_employer, :except => [ :index ]
  
  # GET /credit_applications/:credit_application_id/employers
  def index
    @employers = @credit_application.employers
  end

  # GET /credit_applications/:credit_application_id/employers/:id
  def show
    head :not_found unless @employer
  end

  # PUT /credit_applications/:credit_application_id/employers/:id
  def update
    if @employer
      if @employer.update_attributes params[:employer]
        head :no_content
      else
        render json: @employer.errors, status: :unprocessable_entity
      end
    else
      @employer = Employer.new params[:employer]
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
    delete_item @employer
  end
  
  private
  
  def find_credit_application
    @credit_application = CreditApplication.find params[:credit_application_id]
    unless @credit_application
      head :not_found
    end
  end

  def find_employer
    @employer = @credit_application.employers.find params[:id]
  end
end
