require "spec_helper"

describe RegistrantsController do
  describe "routing" do

    it "GET /api/registrants routes to #index" do
      get("/api/registrants").should route_to(
        "registrants#index",
        :format => :json
      )
    end

    it "GET /api/registrants/:id routes to #show" do
      get("/api/registrants/17342a32-6cbd-423a-8602-fba90d025231").should route_to(
        "registrants#show",
        :id => "17342a32-6cbd-423a-8602-fba90d025231",
        :format => :json
      )
    end

    it "PUT /api/registrants/:id routes to #update" do
      put("/api/registrants/17342a32-6cbd-423a-8602-fba90d025231").should route_to(
        "registrants#update",
        :id => "17342a32-6cbd-423a-8602-fba90d025231",
        :format => :json
      )
    end

    it "DELETE /api/registrants/:id routes to #destroy" do
      delete("/api/registrants/17342a32-6cbd-423a-8602-fba90d025231").should route_to(
        "registrants#destroy",
        :id => "17342a32-6cbd-423a-8602-fba90d025231",
        :format => :json
      )
    end

  end
end
