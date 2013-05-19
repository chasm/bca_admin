require 'spec_helper'

describe SiteController do
  describe "GET /index" do
    context "when the user is logged in" do
      let!(:current_user) { Fabricate(:user) }
      let!(:authorize) { double("authorize", message: current_user) }
      
      it "the double returns a current user" do
        expect(authorize.message).to eq(current_user)
      end
      
      it "assigns the current user to @user"
      it "renders the index.json.rabl template"
      it "responds with a 200 OK status code" do
        puts current_user
        puts authorize()
        get :index
        expect(response.response_code).to eq 200
      end
    end
    
    context "when no one is logged in" do
      it "responds with a 302 Found status code" do
        get :index
        expect(response.response_code).to eq 302
      end
    end
  end
end