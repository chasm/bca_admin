require "spec_helper"

describe EmployersController do

  describe "routing via credit_applications" do

    it "GET /api/credit_applications/:credit_application_id/employers routes to #index" do
      get("/api/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5/employers").should route_to(
        "employers#index",
        :credit_application_id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :format => :json
      )
    end

    it "GET /api/credit_applications/:credit_application_id/employers/:id routes to #show" do
      get("/api/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5/employers/ee0992f7-052b-4e21-8502-24dba3d8a4a5").should route_to(
        "employers#show",
        :credit_application_id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :id => "ee0992f7-052b-4e21-8502-24dba3d8a4a5",
        :format => :json
      )
    end

    it "PUT /api/credit_applications/:credit_application_id/employers/:id routes to #update" do
      put("/api/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5/employers/ee0992f7-052b-4e21-8502-24dba3d8a4a5").should route_to(
        "employers#update",
        :credit_application_id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :id => "ee0992f7-052b-4e21-8502-24dba3d8a4a5",
        :format => :json
      )
    end

    it "DELETE /api/credit_applications/:credit_application_id/employers/:id routes to #destroy" do
      delete("/api/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5/employers/ee0992f7-052b-4e21-8502-24dba3d8a4a5").should route_to(
        "employers#destroy",
        :credit_application_id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :id => "ee0992f7-052b-4e21-8502-24dba3d8a4a5",
        :format => :json
      )
    end

  end

  describe "routing via automobiles and credit_applications" do
  
    it "GET /api/automobiles/:automobile_id/credit_applications routes to #index" do
      get("/api/automobiles/818c6527-44a7-485e-af65-cd0e00e081a1/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5/employers").should route_to(
        "employers#index",
        :automobile_id => "818c6527-44a7-485e-af65-cd0e00e081a1",
        :credit_application_id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :format => :json
      )
    end
  
    it "GET /api/automobiles/:automobile_id/credit_applications/:id routes to #show" do
      get("/api/automobiles/818c6527-44a7-485e-af65-cd0e00e081a1/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5/employers/ee0992f7-052b-4e21-8502-24dba3d8a4a5").should route_to(
        "employers#show",
        :automobile_id => "818c6527-44a7-485e-af65-cd0e00e081a1",
        :credit_application_id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :id => "ee0992f7-052b-4e21-8502-24dba3d8a4a5",
        :format => :json
      )
    end
  
    it "PUT /api/automobiles/:automobile_id/credit_applications/:id routes to #update" do
      put("/api/automobiles/818c6527-44a7-485e-af65-cd0e00e081a1/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5/employers/ee0992f7-052b-4e21-8502-24dba3d8a4a5").should route_to(
        "employers#update",
        :automobile_id => "818c6527-44a7-485e-af65-cd0e00e081a1",
        :credit_application_id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :id => "ee0992f7-052b-4e21-8502-24dba3d8a4a5",
        :format => :json
      )
    end
  
    it "DELETE /api/automobiles/:automobile_id/credit_applications/:id routes to #destroy" do
      delete("/api/automobiles/818c6527-44a7-485e-af65-cd0e00e081a1/credit_applications/23aec948-0286-40c8-a419-1888b4e4c0a5/employers/ee0992f7-052b-4e21-8502-24dba3d8a4a5").should route_to(
        "employers#destroy",
        :automobile_id => "818c6527-44a7-485e-af65-cd0e00e081a1",
        :credit_application_id => "23aec948-0286-40c8-a419-1888b4e4c0a5",
        :id => "ee0992f7-052b-4e21-8502-24dba3d8a4a5",
        :format => :json
      )
    end
  
  end
end
