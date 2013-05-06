class SiteController < ApplicationController
  before_filter :authorize, :except => [ :uuids ]
  
  # GET /
  def index
    gon.rabl
    @user = current_user
    gon.rabl :template => "app/views/users/show.json.rabl", :as => "current_user"
  end
  
  # GET /uuids
  # GET /uuids/:count
  def uuids
    count = params[:count].to_i || 1
    
    uuids = get_uuids count
    
    render :json => uuids
  end
end
