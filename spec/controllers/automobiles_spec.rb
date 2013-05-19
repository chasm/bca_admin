require 'spec_helper'

describe AutomobilesController do
  let!(:auto) { Fabricate(:automobile) }
  subject { auto }
  
  describe "GET #index" do
    it "populates an array of Automobiles" do
      get :index, format: :json
      expect(assigns(:automobiles)).to match_array [auto]
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
    context "with an existing automobile" do
      it "assigns the requested automobile to @automobile" do
        get :show, id: auto.id, format: :json
        expect(assigns(:automobile)).to eq auto
      end
    
      it "renders the show.json.rabl template" do
        get :show, id: auto.id, format: :json
        expect(response).to render_template :show
      end
    
      it "responds with a 200 OK status code" do
        get :show, id: auto.id, format: :json
        expect(response.response_code).to eq 200
      end
    end
    
    context "with a non-existant automobile" do
      it "responds with a 404 Not Found status code" do
        get :show, id: "00000000-0000-0000-0000-000000000000", format: :json
        expect(response.response_code).to eq 404
      end
    end
  end

  describe "PUT #update" do
    before :each do
      @automobile = Fabricate(:automobile, year: 1977, make: "Chevy", model: "Monte Carlo")
    end
    
    context "with valid attributes" do
      context "to create a new automobile" do
        it "fails to locate the requested automobile" do
          put :update, id: "00000000-0000-0000-0000-000000000000", contact: Fabricate.attributes_for(:automobile), format: :json
          expect(assigns(:automobile)).not_to eq(@automobile)
        end
        
        it "saves the new automobile to the database" do
          uuid = SecureRandom.uuid
          expect {
            put :update, id: uuid, automobile: Fabricate.attributes_for(:automobile, id: uuid), format: :json
          }.to change(Automobile,:count).by(1)
        end
        
        it "renders the show.json.rabl template" do
          uuid = SecureRandom.uuid
          put :update, id: uuid, automobile: Fabricate.attributes_for(:automobile, id: uuid), format: :json
          expect(response).to render_template :show
        end
        
        it "responds with a 200 OK status code" do
          uuid = SecureRandom.uuid
          put :update, id: uuid, automobile: Fabricate.attributes_for(:automobile, id: uuid), format: :json
          expect(response.response_code).to eq 200
        end
      end
    
      context "to update an existing automobile" do
        it "locates the requested automobile" do
          put :update, id: @automobile, automobile: Fabricate.attributes_for(:automobile, id: @automobile.id), format: :json
          expect(assigns(:automobile)).to eq(@automobile)
        end
        
        it "saves the updated automobile to the database" do
          put :update, id: @automobile, automobile: Fabricate.attributes_for(:automobile, id: @automobile.id, doors: 4), format: :json
          @automobile.reload
          expect(@automobile.doors).to eq 4
        end
        
        it "responds with a 204 No Content status code" do
          put :update, id: @automobile, automobile: Fabricate.attributes_for(:automobile, id: @automobile.id), format: :json
          expect(response.response_code).to eq 204
        end
      end
    end

    context "with invalid attributes" do
      context "to create a new automobile" do
        let(:uuid) { SecureRandom.uuid }
        it "does not save the automobile to the database" do
          expect {
            put :update, id: uuid, automobile: Fabricate.attributes_for(:invalid_automobile, id: uuid), format: :json
          }.not_to change(Automobile,:count).by(1)
        end
        
        it "renders the errors.json.rabl template" do
          put :update, id: uuid, automobile: Fabricate.attributes_for(:invalid_automobile, id: uuid), format: :json
          expect(response).to render_template :errors
        end
        
        it "responds with a 422 Unprocessable Entity status code" do
          put :update, id: uuid, automobile: Fabricate.attributes_for(:invalid_automobile, id: uuid), format: :json
          expect(response.response_code).to eq 422
        end
      end
    
      context "to update an existing automobile" do
        it "locates the requested automobile" do
          put :update, id: @automobile, automobile: Fabricate.attributes_for(:invalid_automobile, id: @automobile.id), format: :json
          expect(assigns(:automobile)).to eq(@automobile)
        end
        
        it "does not update the automobile in the database" do
          put :update, id: @automobile, automobile: Fabricate.attributes_for(:invalid_automobile, id: @automobile.id), format: :json
          @automobile.reload
          expect(@automobile.stock_number).not_to be_nil
        end
        
        it "renders the errors.json.rabl template" do
          put :update, id: @automobile, automobile: Fabricate.attributes_for(:invalid_automobile, id: @automobile.id), format: :json
          expect(response).to render_template :errors
        end
        
        it "responds with a 422 Unprocessable Entity status code" do
          put :update, id: @automobile, automobile: Fabricate.attributes_for(:invalid_automobile, id: @automobile.id), format: :json
          expect(response.response_code).to eq 422
        end
      end
    end
  end

  describe "DELETE #destroy" do
    context "with an existing automobile" do
      before :each do
        @automobile = Fabricate(:automobile)
      end
  
      it "deletes the automobile" do
        expect{ delete :destroy, id: @automobile, format: :json }.to change(Automobile,:count).by(-1)
      end
    
      it "responds with a 204 No Content status code" do
        delete :destroy, id: @automobile, format: :json
        expect(response.response_code).to eq 204
      end
    end
    
    context "with a non-existant automobile" do
      it "responds with a 404 Not Found status code" do
        delete :destroy, id: "00000000-0000-0000-0000-000000000000", format: :json
        expect(response.response_code).to eq 404
      end
    end
  end
end
