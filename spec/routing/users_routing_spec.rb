require "spec_helper"

describe UsersController do
  describe "routing" do

    it "GET /api/users routes to #index" do
      get("/api/users").should route_to(
        "users#index",
        :format => :json
      )
    end

    it "GET /api/users/:id routes to #show" do
      get("/api/users/30bb3472-1f2e-4cfe-941e-753489062ff2").should route_to(
        "users#show",
        :id => "30bb3472-1f2e-4cfe-941e-753489062ff2",
        :format => :json
      )
    end

    it "PUT /api/users/:id routes to #update" do
      put("/api/users/30bb3472-1f2e-4cfe-941e-753489062ff2").should route_to(
        "users#update",
        :id => "30bb3472-1f2e-4cfe-941e-753489062ff2",
        :format => :json
      )
    end

    it "DELETE /api/users/:id routes to #destroy" do
      delete("/api/users/30bb3472-1f2e-4cfe-941e-753489062ff2").should route_to(
        "users#destroy",
        :id => "30bb3472-1f2e-4cfe-941e-753489062ff2",
        :format => :json
      )
    end

  end
end
