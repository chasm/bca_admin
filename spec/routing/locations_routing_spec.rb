require "spec_helper"

describe LocationsController do

  describe "routing via credit_applications" do

    it "GET /api/credit_applications/:credit_application_id/locations routes to #index" do
      get("/api/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5/locations").should route_to(
        "locations#index",
        :credit_application_id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :format => :json
      )
    end

    it "GET /api/credit_applications/:credit_application_id/locations/:id routes to #show" do
      get("/api/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5/locations/ae03e7a5-3a8b-4045-a567-a869ca68af93").should route_to(
        "locations#show",
        :credit_application_id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :id => "ae03e7a5-3a8b-4045-a567-a869ca68af93",
        :format => :json
      )
    end

    it "PUT /api/credit_applications/:credit_application_id/locations/:id routes to #update" do
      put("/api/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5/locations/ae03e7a5-3a8b-4045-a567-a869ca68af93").should route_to(
        "locations#update",
        :credit_application_id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :id => "ae03e7a5-3a8b-4045-a567-a869ca68af93",
        :format => :json
      )
    end

    it "DELETE /api/credit_applications/:credit_application_id/locations/:id routes to #destroy" do
      delete("/api/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5/locations/ae03e7a5-3a8b-4045-a567-a869ca68af93").should route_to(
        "locations#destroy",
        :credit_application_id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :id => "ae03e7a5-3a8b-4045-a567-a869ca68af93",
        :format => :json
      )
    end

  end

  describe "routing via automobiles and credit_applications" do
  
    it "GET /api/automobiles/:automobile_id/credit_applications routes to #index" do
      get("/api/automobiles/818c6527-44a7-485e-af65-cd0e00e081a1/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5/locations").should route_to(
        "locations#index",
        :automobile_id => "818c6527-44a7-485e-af65-cd0e00e081a1",
        :credit_application_id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :format => :json
      )
    end
  
    it "GET /api/automobiles/:automobile_id/credit_applications/:id routes to #show" do
      get("/api/automobiles/818c6527-44a7-485e-af65-cd0e00e081a1/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5/locations/ae03e7a5-3a8b-4045-a567-a869ca68af93").should route_to(
        "locations#show",
        :automobile_id => "818c6527-44a7-485e-af65-cd0e00e081a1",
        :credit_application_id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :id => "ae03e7a5-3a8b-4045-a567-a869ca68af93",
        :format => :json
      )
    end
  
    it "PUT /api/automobiles/:automobile_id/credit_applications/:id routes to #update" do
      put("/api/automobiles/818c6527-44a7-485e-af65-cd0e00e081a1/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5/locations/ae03e7a5-3a8b-4045-a567-a869ca68af93").should route_to(
        "locations#update",
        :automobile_id => "818c6527-44a7-485e-af65-cd0e00e081a1",
        :credit_application_id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :id => "ae03e7a5-3a8b-4045-a567-a869ca68af93",
        :format => :json
      )
    end
  
    it "DELETE /api/automobiles/:automobile_id/credit_applications/:id routes to #destroy" do
      delete("/api/automobiles/818c6527-44a7-485e-af65-cd0e00e081a1/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5/locations/ae03e7a5-3a8b-4045-a567-a869ca68af93").should route_to(
        "locations#destroy",
        :automobile_id => "818c6527-44a7-485e-af65-cd0e00e081a1",
        :credit_application_id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :id => "ae03e7a5-3a8b-4045-a567-a869ca68af93",
        :format => :json
      )
    end
  
  end
end
