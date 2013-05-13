require "spec_helper"

describe SiteController do
  describe "routing" do

    it "GET /autos routes to #index" do
      get("/autos").should route_to("site#index")
    end

    it "GET /autos/new routes to #index" do
      get("/autos/new").should route_to("site#index")
    end

    it "GET /auto/:id routes to #index" do
      get("/auto/818c6527-44a7-485e-af65-cd0e00e081a1").should route_to(
        "site#index",
        :id => "818c6527-44a7-485e-af65-cd0e00e081a1"
      )
    end

    it "GET /auto/:id/edit routes to #index" do
      get("/auto/818c6527-44a7-485e-af65-cd0e00e081a1/edit").should route_to(
        "site#index",
        :id => "818c6527-44a7-485e-af65-cd0e00e081a1"
      )
    end

    it "GET /credit_apps routes to #index" do
      get("/credit_apps").should route_to("site#index")
    end

    it "GET /credit_apps/new routes to #index" do
      get("/credit_apps/new").should route_to("site#index")
    end

    it "GET /credit_app/:id routes to #index" do
      get("/credit_app/23aec948-0286-40c8-a419-1888b4e4c0a5").should route_to(
        "site#index",
        :id => "23aec948-0286-40c8-a419-1888b4e4c0a5"
      )
    end

    it "GET /credit_app/:id/edit routes to #index" do
      get("/credit_app/23aec948-0286-40c8-a419-1888b4e4c0a5/edit").should route_to(
        "site#index",
        :id => "23aec948-0286-40c8-a419-1888b4e4c0a5"
      )
    end

    it "GET /users routes to #index" do
      get("/users").should route_to("site#index")
    end

    it "GET /users/new routes to #index" do
      get("/users/new").should route_to("site#index")
    end

    it "GET /user/:id routes to #index" do
      get("/user/30bb3472-1f2e-4cfe-941e-753489062ff2").should route_to(
        "site#index",
        :id => "30bb3472-1f2e-4cfe-941e-753489062ff2"
      )
    end

    it "GET /user/:id/edit routes to #index" do
      get("/user/30bb3472-1f2e-4cfe-941e-753489062ff2/edit").should route_to(
        "site#index",
        :id => "30bb3472-1f2e-4cfe-941e-753489062ff2"
      )
    end

    it "GET /api/uuids routes to #uuids" do
      get("/api/uuids").should route_to(
        "site#uuids"
      )
    end

    it "GET /api/uuids/:count routes to #uuids" do
      get("/api/uuids/100").should route_to(
        "site#uuids",
        :count => "100"
      )
    end

  end
end
