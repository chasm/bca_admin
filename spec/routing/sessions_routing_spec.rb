require "spec_helper"

describe SessionsController do
  describe "routing" do

    it "GET /login routes to #new" do
      get("/login").should route_to("sessions#new")
    end

    it "POST /login routes to #create" do
      post("/login").should route_to("sessions#create")
    end

    it "GET /logout routes to #destroy" do
      get("/logout").should route_to("sessions#destroy")
    end

    it "GET /reset/:code routes to #reset" do
      get("/reset/3f1571c5-0a6d-43d2-ab0c-39823cc62686").should route_to(
        "sessions#reset",
        :code => "3f1571c5-0a6d-43d2-ab0c-39823cc62686"
      )
    end

    it "PUT /reset/:code routes to #reset_password" do
      put("/reset/3f1571c5-0a6d-43d2-ab0c-39823cc62686").should route_to(
        "sessions#reset_password",
        :code => "3f1571c5-0a6d-43d2-ab0c-39823cc62686"
      )
    end

  end
end
