require "spec_helper"

describe CreditApplicationsController do
  describe "routing" do

    it "GET /api/credit_applications routes to #index" do
      get("/api/credit_applications").should route_to(
        "credit_applications#index",
        :format => :json
      )
    end

    it "GET /api/credit_applications/:id routes to #show" do
      get("/api/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5").should route_to(
        "credit_applications#show",
        :id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :format => :json
      )
    end

    it "PUT /api/credit_applications/:id routes to #update" do
      put("/api/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5").should route_to(
        "credit_applications#update",
        :id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :format => :json
      )
    end

    it "DELETE /api/credit_applications/:id routes to #destroy" do
      delete("/api/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5").should route_to(
        "credit_applications#destroy",
        :id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :format => :json
      )
    end

  end

  describe "routing via automobiles" do

    it "GET /api/automobiles/:automobile_id/credit_applications routes to #index" do
      get("/api/automobiles/818c6527-44a7-485e-af65-cd0e00e081a1/credit_applications").should route_to(
        "credit_applications#index",
        :automobile_id => "818c6527-44a7-485e-af65-cd0e00e081a1",
        :format => :json
      )
    end

    it "GET /api/automobiles/:automobile_id/credit_applications/:id routes to #show" do
      get("/api/automobiles/818c6527-44a7-485e-af65-cd0e00e081a1/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5").should route_to(
        "credit_applications#show",
        :id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :automobile_id => "818c6527-44a7-485e-af65-cd0e00e081a1",
        :format => :json
      )
    end

    it "PUT /api/automobiles/:automobile_id/credit_applications/:id routes to #update" do
      put("/api/automobiles/818c6527-44a7-485e-af65-cd0e00e081a1/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5").should route_to(
        "credit_applications#update",
        :id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :automobile_id => "818c6527-44a7-485e-af65-cd0e00e081a1",
        :format => :json
      )
    end

    it "DELETE /api/automobiles/:automobile_id/credit_applications/:id routes to #destroy" do
      delete("/api/automobiles/818c6527-44a7-485e-af65-cd0e00e081a1/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5").should route_to(
        "credit_applications#destroy",
        :id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :automobile_id => "818c6527-44a7-485e-af65-cd0e00e081a1",
        :format => :json
      )
    end

  end
end
