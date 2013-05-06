class CreditApplicationsController < ApplicationController
  respond_to :json
  
  before_filter :find_credit_application, :except => [ :index ]
  
  # GET /credit_applications
  def index
    @credit_applications = CreditApplication.all
  end

  # GET /credit_applications/:id
  def show
    head :not_found unless @credit_application
  end

  # PUT /credit_applications/:id
  def update
    if @credit_application
      if @credit_application.update_attributes params[:credit_application]
        head :no_content
      else
        render :errors, status: :unprocessable_entity 
      end
    else
      @credit_application = CreditApplication.new params[:credit_application]
      @credit_application.id = params[:id]
      
      if @credit_application.save
        render :show
      else
        render :errors, status: :unprocessable_entity 
      end
    end
  end

  # DELETE /credit_applications/:id
  def destroy
    delete_item @credit_application
  end
  
  private
  
  def find_credit_application
    @credit_application = CreditApplication.find params[:id]
  end
end
