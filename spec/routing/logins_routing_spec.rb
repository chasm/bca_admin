require "spec_helper"

describe LoginsController do
  describe "routing via users" do

    it "GET /api/users/:user_id/logins routes to #index" do
      get("/api/users/30bb3472-1f2e-4cfe-941e-753489062ff2/logins").should route_to(
        "logins#index",
        :user_id => "30bb3472-1f2e-4cfe-941e-753489062ff2",
        :format => :json
      )
    end

    it "GET /api/users/:user_id/logins/:id routes to #show" do
      get("/api/users/30bb3472-1f2e-4cfe-941e-753489062ff2/logins/274e3435-30d9-4fe8-ba8c-3914a10a9d59").should route_to(
        "logins#show",
        :user_id => "30bb3472-1f2e-4cfe-941e-753489062ff2",
        :id => "274e3435-30d9-4fe8-ba8c-3914a10a9d59",
        :format => :json
      )
    end

    it "DELETE /api/users/:user_id/logins/:id routes to #destroy" do
      delete("/api/users/30bb3472-1f2e-4cfe-941e-753489062ff2/logins/274e3435-30d9-4fe8-ba8c-3914a10a9d59").should route_to(
        "logins#destroy",
        :user_id => "30bb3472-1f2e-4cfe-941e-753489062ff2",
        :id => "274e3435-30d9-4fe8-ba8c-3914a10a9d59",
        :format => :json
      )
    end

  end
end
