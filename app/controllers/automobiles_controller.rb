class AutomobilesController < ApplicationController
  respond_to :json
  
  # GET /automobiles
  def index
    @automobiles = Automobile.all
  end

  # GET /automobiles/:id
  def show
    @automobile = Automobile.find(params[:id])

    render json: @automobile
  end

  # PUT /automobiles/:id
  def update
    @automobile = Automobile.find(params[:id])
    
    if @automobile
      if @automobile.update_attributes(params[:automobile])
        head :no_content
      else
        render json: @automobile.errors, status: :unprocessable_entity 
      end
    else
      @automobile = Automobile.new(params[:automobile])
      @automobile.id = params[:id]
      
      if @automobile.save
        render json: @automobile
      else
        render json: @automobile.errors, status: :unprocessable_entity 
      end
    end
  end

  # DELETE /automobiles/:id
  def destroy
    @automobile = Automobile.find(params[:id])
    @automobile.destroy

    head :no_content
  end
end
