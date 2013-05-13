require "spec_helper"

describe PhoneNumbersController do
  describe "routing via users" do

    it "GET /api/users/:user_id/phone_numbers routes to #index" do
      get("/api/users/30bb3472-1f2e-4cfe-941e-753489062ff2/phone_numbers").should route_to(
        "phone_numbers#index",
        :user_id => "30bb3472-1f2e-4cfe-941e-753489062ff2",
        :format => :json
      )
    end

    it "GET /api/users/:user_id/phone_numbers/:id routes to #show" do
      get("/api/users/30bb3472-1f2e-4cfe-941e-753489062ff2/phone_numbers/274e3435-30d9-4fe8-ba8c-3914a10a9d59").should route_to(
        "phone_numbers#show",
        :user_id => "30bb3472-1f2e-4cfe-941e-753489062ff2",
        :id => "274e3435-30d9-4fe8-ba8c-3914a10a9d59",
        :format => :json
      )
    end

    it "PUT /api/users/:user_id/phone_numbers/:id routes to #update" do
      put("/api/users/30bb3472-1f2e-4cfe-941e-753489062ff2/phone_numbers/274e3435-30d9-4fe8-ba8c-3914a10a9d59").should route_to(
        "phone_numbers#update",
        :user_id => "30bb3472-1f2e-4cfe-941e-753489062ff2",
        :id => "274e3435-30d9-4fe8-ba8c-3914a10a9d59",
        :format => :json
      )
    end

    it "DELETE /api/users/:user_id/phone_numbers/:id routes to #destroy" do
      delete("/api/users/30bb3472-1f2e-4cfe-941e-753489062ff2/phone_numbers/274e3435-30d9-4fe8-ba8c-3914a10a9d59").should route_to(
        "phone_numbers#destroy",
        :user_id => "30bb3472-1f2e-4cfe-941e-753489062ff2",
        :id => "274e3435-30d9-4fe8-ba8c-3914a10a9d59",
        :format => :json
      )
    end

  end
end
