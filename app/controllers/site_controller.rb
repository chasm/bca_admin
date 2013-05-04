class SiteController < ApplicationController
  # before_filter :authorize, :except => [ :uuids ]
  
  # GET /
  def index
    render 'site/index', :layout => false
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
