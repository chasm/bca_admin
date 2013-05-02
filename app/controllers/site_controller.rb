class SiteController < ApplicationController
  # before_filter :authorize, :except => [ :login ]
  
  # GET /
  def index
  end

  # GET /autos
  def autos
    @available = Automobile.available.order('year, make, model, color')
    @pending = Automobile.pending.order('year, make, model, color')
    @sold = Automobile.sold.order('year, make, model, color')
  end
  
  # def auto_new
  #   @automobile = Automobile.new
  # end
  # 
  # def auto_detail
  #   @automobile = Automobile.find(params[:id])
  # end
  # 
  # def auto_edit
  #   @automobile = Automobile.find(params[:id])
  #   
  #   render :partial => 'auto_form', :layout => false
  # end
  # 
  # def auto_update
  #   @automobile = Automobile.find(params[:id])
  #   @automobile.status = params[:status] if params[:status]
  #   @automobile.save
  #   
  #   @available = Automobile.available.order('year, make, model, color')
  #   @pending = Automobile.pending.order('year, make, model, color')
  #   @sold = Automobile.sold.order('year, make, model, color')
  #   
  #   render :template => 'admin/automobiles', :layout => false
  # end

  # GET /apps
  def apps
  end

  # GET /users
  def users
  end
  
  # GET /uuids
  # GET /uuids/:count
  def uuids
    count = params[:count].to_i || 1
    
    uuids = (0...count).to_a.map do
      SecureRandom.uuid
    end
    
    render :json => uuids
  end
end
