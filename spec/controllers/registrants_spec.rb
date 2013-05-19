require 'spec_helper'

describe RegistrantsController do
  let!(:reg) { Fabricate(:registrant) }
  subject { reg }
  
  describe "GET #index" do
    it "populates an array of Registrants" do
      get :index, format: :json
      expect(assigns(:registrants)).to match_array [reg]
    end
    
    it "renders the index.json.rabl template" do
      get :index, format: :json
      expect(response).to render_template :index
    end
    
    it "responds with a 200 OK status code" do
      get :index, format: :json
      expect(response.response_code).to eq 200
    end
  end

  describe "GET #show" do
    context "with an existing registrant" do
      it "assigns the requested registrant to @registrant" do
        get :show, id: reg.id, format: :json
        expect(assigns(:registrant)).to eq reg
      end
    
      it "renders the show.json.rabl template" do
        get :show, id: reg.id, format: :json
        expect(response).to render_template :show
      end
    
      it "responds with a 200 OK status code" do
        get :show, id: reg.id, format: :json
        expect(response.response_code).to eq 200
      end
    end
    
    context "with a non-existant registrant" do
      it "responds with a 404 Not Found status code" do
        new_id = SecureRandom.uuid
        get :show, id: new_id, format: :json
        expect(response.response_code).to eq 404
      end
    end
  end

  describe "PUT #update" do
    before :each do
      @registrant = Fabricate(:registrant, year: 1977, make: "Chevy", model: "Monte Carlo")
    end
    
    context "with valid attributes" do
      context "to create a new registrant" do
        it "fails to locate the requested registrant" do
          new_id = SecureRandom.uuid
          put :update, id: new_id, contact: Fabricate.attributes_for(:registrant), format: :json
          expect(assigns(:registrant)).not_to eq(@registrant)
        end
        
        it "saves the new registrant to the database" do
          uuid = SecureRandom.uuid
          expect {
            put :update, id: uuid, registrant: Fabricate.attributes_for(:registrant, id: uuid), format: :json
          }.to change(Registrant,:count).by(1)
        end
        
        it "renders the show.json.rabl template" do
          uuid = SecureRandom.uuid
          put :update, id: uuid, registrant: Fabricate.attributes_for(:registrant, id: uuid), format: :json
          expect(response).to render_template :show
        end
        
        it "responds with a 200 OK status code" do
          uuid = SecureRandom.uuid
          put :update, id: uuid, registrant: Fabricate.attributes_for(:registrant, id: uuid), format: :json
          expect(response.response_code).to eq 200
        end
      end
    
      context "to update an existing registrant" do
        it "locates the requested registrant" do
          put :update, id: @registrant, registrant: Fabricate.attributes_for(:registrant, id: @registrant.id), format: :json
          expect(assigns(:registrant)).to eq(@registrant)
        end
        
        it "saves the updated registrant to the database" do
          email = "bob@munat.com"
          put :update, id: @registrant, registrant: Fabricate.attributes_for(:registrant, id: @registrant.id, email: email), format: :json
          @registrant.reload
          expect(@registrant.email).to eq email
        end
        
        it "responds with a 204 No Content status code" do
          put :update, id: @registrant, registrant: Fabricate.attributes_for(:registrant, id: @registrant.id), format: :json
          expect(response.response_code).to eq 204
        end
      end
    end

    context "with invalid attributes" do
      context "to create a new registrant" do
        let(:uuid) { SecureRandom.uuid }
        it "does not save the registrant to the database" do
          expect {
            put :update, id: uuid, registrant: Fabricate.attributes_for(:invalid_registrant, id: uuid), format: :json
          }.not_to change(Registrant,:count).by(1)
        end
        
        it "renders the errors.json.rabl template" do
          put :update, id: uuid, registrant: Fabricate.attributes_for(:invalid_registrant, id: uuid), format: :json
          expect(response).to render_template :errors
        end
        
        it "responds with a 422 Unprocessable Entity status code" do
          put :update, id: uuid, registrant: Fabricate.attributes_for(:invalid_registrant, id: uuid), format: :json
          expect(response.response_code).to eq 422
        end
      end
    
      context "to update an existing registrant" do
        it "locates the requested registrant" do
          put :update, id: @registrant, registrant: Fabricate.attributes_for(:invalid_registrant, id: @registrant.id), format: :json
          expect(assigns(:registrant)).to eq(@registrant)
        end
        
        it "does not update the registrant in the database" do
          put :update, id: @registrant, registrant: Fabricate.attributes_for(:invalid_registrant, id: @registrant.id), format: :json
          @registrant.reload
          expect(@registrant.email).not_to be_nil
        end
        
        it "renders the errors.json.rabl template" do
          put :update, id: @registrant, registrant: Fabricate.attributes_for(:invalid_registrant, id: @registrant.id), format: :json
          expect(response).to render_template :errors
        end
        
        it "responds with a 422 Unprocessable Entity status code" do
          put :update, id: @registrant, registrant: Fabricate.attributes_for(:invalid_registrant, id: @registrant.id), format: :json
          expect(response.response_code).to eq 422
        end
      end
    end
  end

  describe "DELETE #destroy" do
    context "with an existing registrant" do
      before :each do
        @registrant = Fabricate(:registrant)
      end
  
      it "deletes the registrant" do
        expect{ delete :destroy, id: @registrant, format: :json }.to change(Registrant,:count).by(-1)
      end
    
      it "responds with a 204 No Content status code" do
        delete :destroy, id: @registrant, format: :json
        expect(response.response_code).to eq 204
      end
    end
    
    context "with a non-existant registrant" do
      it "responds with a 404 Not Found status code" do
        new_id = SecureRandom.uuid
        delete :destroy, id: new_id, format: :json
        expect(response.response_code).to eq 404
      end
    end
  end
end
