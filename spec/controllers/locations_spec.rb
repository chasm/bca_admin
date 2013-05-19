require 'spec_helper'

describe LocationsController do
  context "via a credit_application" do
    before :each do
      @app1 = Fabricate(:credit_application_with_locations)
      @app2 = Fabricate(:credit_application)
      @loc = @app1.locations.first
    end
    
    describe "GET #index" do
      it "assigns the correct credit_application to @credit_application" do
        get :index, credit_application_id: @app1.id, format: :json
        expect(assigns(:credit_application)).to eq @app1
      end
      
      it "populates an array of Locations associated with that specific credit_application" do
        get :index, credit_application_id: @app1.id, format: :json
        expect(assigns(:locations)).to match_array @app1.locations
      end
    
      it "renders the index.json.rabl template" do
        get :index, credit_application_id: @app1.id, format: :json
        expect(response).to render_template :index
      end
    
      it "responds with a 200 OK status code" do
        get :index, credit_application_id: @app1.id, format: :json
        expect(response.response_code).to eq 200
      end
    end
  
    describe "GET #show" do
      it "assigns the correct credit_application to @credit_application" do
        get :index, credit_application_id: @app1.id, format: :json
        expect(assigns(:credit_application)).to eq @app1
      end
      
      context "if the location is associated with that specific credit_application" do
        it "assigns the requested location to @loc" do
          get :show, credit_application_id: @app1.id, id: @loc.id, format: :json
          expect(@loc).not_to be_nil
          expect(assigns(:location)).to eq @loc
        end
    
        it "renders the show.json.rabl template" do
          get :show, credit_application_id: @app1.id, id: @loc.id, format: :json
          expect(response).to render_template :show
        end
    
        it "responds with a 200 OK status code" do
          get :show, credit_application_id: @app1.id, id: @loc.id, format: :json
          expect(response.response_code).to eq 200
        end
      end
      
      context "if the location is NOT associated with that specific credit_application" do
        it "assigns nil to @location" do
          get :show, credit_application_id: @app2.id, id: @loc.id, format: :json
          expect(assigns(:location)).to be_nil
        end
    
        it "responds with a 404 Not Found status code" do
          get :show, credit_application_id: @app2.id, id: @loc.id, format: :json
          expect(response.response_code).to eq 404
        end
      end
    end
  
    describe "PUT #update" do
      let!(:new_id) { SecureRandom.uuid }
      
      it "assigns the correct credit_application to @credit_application" do
        get :index, credit_application_id: @app1.id, format: :json
        expect(assigns(:credit_application)).to eq @app1
      end
      
      context "if the location is associated with that specific credit_application" do
        it "assigns the requested location to @location" do
          put :update, credit_application_id: @app1.id, id: @loc.id, format: :json
          expect(assigns(:location)).to eq @loc
        end
      end
      
      context "if the location is NOT associated with that specific credit_application" do
        it "assigns nil to @location" do
          put :update, credit_application_id: @app2.id, id: @loc.id, format: :json
          expect(assigns(:location)).to be_nil
        end
      end
    
      context "with valid attributes" do
        context "to create a new location" do
          it "fails to locate the requested location" do
            put :update, credit_application_id: @app2.id, id: new_id, location: Fabricate.attributes_for(:location, id: new_id), format: :json
            expect(assigns(:location)).to be_nil
          end
        
          it "saves the new location to the database" do
            put :update, credit_application_id: @app2.id, id: new_id, location: Fabricate.attributes_for(:location, id: new_id), format: :json
            @app2.reload
            expect(@app2.locations.first.id).to eq new_id
          end
        
          it "renders the show.json.rabl template" do
            put :update, credit_application_id: @app2.id, id: new_id, location: Fabricate.attributes_for(:location, id: new_id), format: :json
            expect(response).to render_template :show
          end
        
          it "responds with a 200 OK status code" do
            put :update, credit_application_id: @app2.id, id: new_id, location: Fabricate.attributes_for(:location, id: new_id), format: :json
            expect(response.response_code).to eq 200
          end
        end
    
        context "to update an existing location" do
          it "locates the requested location" do
            put :update, credit_application_id: @app1.id, id: @loc, location: Fabricate.attributes_for(:location, id: @loc.id), format: :json
            expect(assigns(:location)).to eq(@loc)
          end
        
          it "saves the updated location to the database" do
            address_line_one = "Google"
            put :update, credit_application_id: @app1.id, id: @loc, location: Fabricate.attributes_for(:location, id: @loc.id, address_line_one: address_line_one), format: :json
            @loc.reload
            expect(@loc.address_line_one).to eq address_line_one
          end
        
          it "responds with a 204 No Content status code" do
            put :update, credit_application_id: @app1.id, id: @loc, location: Fabricate.attributes_for(:location, id: @loc.id), format: :json
            expect(response.response_code).to eq 204
          end
        end
      end
    end

    context "with invalid attributes" do
      context "to create a new location" do
        let!(:uuid) { SecureRandom.uuid }
        
        it "does not save the location to the database" do
          expect {
            put :update, credit_application_id: @app1.id, id: uuid, location: Fabricate.attributes_for(:invalid_location, id: uuid), format: :json
            @app1.reload
          }.not_to change(@app1.locations, :count).by(1)
        end
        
        it "renders the errors.json.rabl template" do
          put :update, credit_application_id: @app1.id, id: uuid, location: Fabricate.attributes_for(:invalid_location, id: uuid), format: :json
          expect(response).to render_template :errors
        end
        
        it "responds with a 422 Unprocessable Entity status code" do
          put :update, credit_application_id: @app1.id, id: uuid, location: Fabricate.attributes_for(:invalid_location, id: uuid), format: :json
          expect(response.response_code).to eq 422
        end
      end
    
      context "to update an existing location" do
        it "locates the requested location" do
          put :update, credit_application_id: @app1.id, id: @loc, location: Fabricate.attributes_for(:invalid_location, id: @loc.id), format: :json
          expect(assigns(:location)).to eq(@loc)
        end
        
        it "does not update the location in the database" do
          put :update, credit_application_id: @app1.id, id: @loc, location: Fabricate.attributes_for(:invalid_location, id: @loc.id), format: :json
          @loc.reload
          expect(@loc.address_line_one).not_to be_nil
        end
        
        it "renders the errors.json.rabl template" do
          put :update, credit_application_id: @app1.id, id: @loc, location: Fabricate.attributes_for(:invalid_location, id: @loc.id), format: :json
          expect(response).to render_template :errors
        end
        
        it "responds with a 422 Unprocessable Entity status code" do
          put :update, credit_application_id: @app1.id, id: @loc, location: Fabricate.attributes_for(:invalid_location, id: @loc.id), format: :json
          expect(response.response_code).to eq 422
        end
      end
    end
  
    describe "DELETE #destroy" do
      it "assigns the correct credit application to @credit_application" do
        get :index, credit_application_id: @app1.id, format: :json
        expect(assigns(:credit_application)).to eq @app1
      end
      
      context "if the location is associated with that specific credit application" do
        it "assigns the requested location to @location" do
          delete :destroy, credit_application_id: @app1.id, id: @loc.id, format: :json
          expect(assigns(:location)).to eq @loc
        end
        
        it "deletes the specified location" do
          loc_id = @loc.id
          delete :destroy, credit_application_id: @app1.id, id: @loc.id, format: :json
          app = Location.where(id: loc_id).to_a
          expect(app).to have(0).things
        end
    
        it "responds with a 204 No Content status code" do
          delete :destroy, credit_application_id: @app1.id, id: @loc.id, format: :json
          expect(response.response_code).to eq 204
        end
      end
      
      context "if the location is NOT associated with that specific credit_application" do
        it "assigns nil to @location" do
          delete :destroy, credit_application_id: @app2.id, id: @loc.id, format: :json
          expect(assigns(:location)).to be_nil
        end
        
        it "does NOT delete the specified location" do
          delete :destroy, credit_application_id: @app2.id, id: @loc.id, format: :json
          expect(@app1.locations).to include @loc
        end
    
        it "responds with a 404 Not Found status code" do
          delete :destroy, credit_application_id: @app2.id, id: @loc.id, format: :json
          expect(response.response_code).to eq 404
        end
      end
    end
  end
end
