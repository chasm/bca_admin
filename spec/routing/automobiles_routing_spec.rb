require "spec_helper"

describe AutomobilesController do
  describe "routing" do

    it "GET /api/automobiles routes to #index" do
      get("/api/automobiles").should route_to(
        "automobiles#index",
        :format => :json
      )
    end

    it "GET /api/automobiles/:id routes to #show" do
      get("/api/automobiles/23aec948-0286-40c8-a419-1888b4e4c0a5").should route_to(
        "automobiles#show",
        :id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :format => :json
      )
    end

    it "PUT /api/automobiles/:id routes to #update" do
      put("/api/automobiles/23aec948-0286-40c8-a419-1888b4e4c0a5").should route_to(
        "automobiles#update",
        :id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :format => :json
      )
    end

    it "DELETE /api/automobiles/:id routes to #destroy" do
      delete("/api/automobiles/23aec948-0286-40c8-a419-1888b4e4c0a5").should route_to(
        "automobiles#destroy",
        :id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :format => :json
      )
    end

  end
end
