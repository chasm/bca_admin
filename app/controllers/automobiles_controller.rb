class AutomobilesController < ApplicationController
  respond_to :json
  
  before_filter :find_automobile, :except => [ :index ]
  
  # GET /automobiles
  def index
    @automobiles = Automobile.all
  end

  # GET /automobiles/:id
  def show
    head :not_found unless @automobile
  end

  # PUT /automobiles/:id
  def update
    if @automobile
      if @automobile.update_attributes params[:automobile]
        head :no_content
      else
        render :errors, status: :unprocessable_entity 
      end
    else
      @automobile = Automobile.new params[:automobile]
      @automobile.id = params[:id]
      
      if @automobile.save
        render :show
      else
        render :errors, status: :unprocessable_entity 
      end
    end
  end

  # DELETE /automobiles/:id
  def destroy
    delete_item @automobile
  end
  
  private
  
  def find_automobile
    @automobile = Automobile.find params[:id]
  end
end
