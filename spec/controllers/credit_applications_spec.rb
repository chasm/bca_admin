require 'spec_helper'

describe CreditApplicationsController do
  let!(:credit_app) { Fabricate(:credit_application) }
  subject { credit_app }
  
  describe "GET #index" do
    it "populates an array of CreditApplications" do
      get :index, format: :json
      expect(assigns(:credit_applications)).to match_array [credit_app]
    end
    
    it "renders the index.json.rabl template" do
      get :index, format: :json
      expect(response).to render_template :index
    end
    
    it "responds with a 200 OK status code" do
      get :index, format: :json
      expect(response.response_code).to eq 200
    end
    
    context "via an automobile" do
      before :each do
        @auto = Fabricate(:automobile)
        @app1 = Fabricate(:credit_application, automobile_id: @auto.id)
        @app2 = Fabricate(:credit_application, automobile_id: @auto.id)
        @app3 = Fabricate(:credit_application)
        @auto.save
      end
      
      it "assigns the correct automobile to @automobile" do
        get :index, automobile_id: @auto.id, format: :json
        expect(assigns(:automobile)).to eq @auto
      end
      
      it "populates an array of CreditApplications associated with that specific automobile" do
        get :index, automobile_id: @auto.id, format: :json
        expect(assigns(:credit_applications)).to match_array [ @app1, @app2 ]
      end
    
      it "renders the index.json.rabl template" do
        get :index, automobile_id: @auto.id, format: :json
        expect(response).to render_template :index
      end
    
      it "responds with a 200 OK status code" do
        get :index, automobile_id: @auto.id, format: :json
        expect(response.response_code).to eq 200
      end
    end
  end

  describe "GET #show" do
    context "with an existing credit_application" do
      it "assigns the requested credit_application to @credit_application" do
        get :show, id: credit_app.id, format: :json
        expect(assigns(:credit_application)).to eq credit_app
      end
    
      it "renders the show.json.rabl template" do
        get :show, id: credit_app.id, format: :json
        expect(response).to render_template :show
      end
    
      it "responds with a 200 OK status code" do
        get :show, id: credit_app.id, format: :json
        expect(response.response_code).to eq 200
      end
    end
    
    context "with a non-existant credit_application" do
      it "responds with a 404 Not Found status code" do
        get :show, id: "00000000-0000-0000-0000-000000000000", format: :json
        expect(response.response_code).to eq 404
      end
    end
    
    context "via an automobile" do
      before :each do
        @auto = Fabricate(:automobile)
        @app1 = Fabricate(:credit_application, automobile_id: @auto.id)
        @app2 = Fabricate(:credit_application)
        @auto.save
      end
      
      it "assigns the correct automobile to @automobile" do
        get :show, automobile_id: @auto.id, id: @app1.id, format: :json
        expect(assigns(:automobile)).to eq @auto
      end
      
      context "if the credit application is associated with that specific automobile" do
        it "assigns the requested credit_application to @credit_application" do
          get :show, automobile_id: @auto.id, id: @app1.id, format: :json
          expect(assigns(:credit_application)).to eq @app1
        end
    
        it "renders the show.json.rabl template" do
          get :show, automobile_id: @auto.id, id: @app1.id, format: :json
          expect(response).to render_template :show
        end
    
        it "responds with a 200 OK status code" do
          get :show, automobile_id: @auto.id, id: @app1.id, format: :json
          expect(response.response_code).to eq 200
        end
      end
      
      context "if the credit application is NOT associated with that specific automobile" do
        it "assigns nil to @credit_application" do
          get :show, automobile_id: @auto.id, id: @app2.id, format: :json
          expect(assigns(:credit_application)).to be_nil
        end
    
        it "responds with a 404 Not Found status code" do
          get :show, automobile_id: @auto.id, id: @app2.id, format: :json
          expect(response.response_code).to eq 404
        end
      end
    end
  end

  describe "PUT #update" do
    before :each do
      @credit_application = Fabricate(:credit_application, social_security_number: "333558888", status: "new", loan_amount: 50_000)
    end
    
    context "with valid attributes" do
      context "to create a new credit_application" do
        it "fails to locate the requested credit_application" do
          put :update, id: "00000000-0000-0000-0000-000000000000", credit_application: Fabricate.attributes_for(:credit_application), format: :json
          expect(assigns(:credit_application)).not_to eq(@credit_application)
        end
        
        it "saves the new credit_application to the database" do
          uuid = SecureRandom.uuid
          expect {
            put :update, id: uuid, credit_application: Fabricate.attributes_for(:credit_application, id: uuid), format: :json
          }.to change(CreditApplication,:count).by(1)
        end
        
        it "renders the show.json.rabl template" do
          uuid = SecureRandom.uuid
          put :update, id: uuid, credit_application: Fabricate.attributes_for(:credit_application, id: uuid), format: :json
          expect(response).to render_template :show
        end
        
        it "responds with a 200 OK status code" do
          uuid = SecureRandom.uuid
          put :update, id: uuid, credit_application: Fabricate.attributes_for(:credit_application, id: uuid), format: :json
          expect(response.response_code).to eq 200
        end
      end
    
      context "to update an existing credit_application" do
        it "locates the requested credit_application" do
          put :update, id: @credit_application, credit_application: Fabricate.attributes_for(:credit_application, id: @credit_application.id), format: :json
          expect(assigns(:credit_application)).to eq(@credit_application)
        end
        
        it "saves the updated credit_application to the database" do
          bob = "Bob"
          put :update, id: @credit_application, credit_application: Fabricate.attributes_for(:credit_application, id: @credit_application.id, sales_person: bob), format: :json
          @credit_application.reload
          expect(@credit_application.sales_person).to eq bob
        end
        
        it "responds with a 204 No Content status code" do
          put :update, id: @credit_application, credit_application: Fabricate.attributes_for(:credit_application, id: @credit_application.id), format: :json
          expect(response.response_code).to eq 204
        end
      end
    end

    context "with invalid attributes" do
      context "to create a new credit_application" do
        let(:uuid) { SecureRandom.uuid }
        it "does not save the credit_application to the database" do
          expect {
            put :update, id: uuid, credit_application: Fabricate.attributes_for(:invalid_credit_application, id: uuid), format: :json
          }.not_to change(CreditApplication,:count).by(1)
        end
        
        it "renders the errors.json.rabl template" do
          put :update, id: uuid, credit_application: Fabricate.attributes_for(:invalid_credit_application, id: uuid), format: :json
          expect(response).to render_template :errors
        end
        
        it "responds with a 422 Unprocessable Entity status code" do
          put :update, id: uuid, credit_application: Fabricate.attributes_for(:invalid_credit_application, id: uuid), format: :json
          expect(response.response_code).to eq 422
        end
      end
    
      context "to update an existing credit_application" do
        it "locates the requested credit_application" do
          put :update, id: @credit_application, credit_application: Fabricate.attributes_for(:invalid_credit_application, id: @credit_application.id), format: :json
          expect(assigns(:credit_application)).to eq(@credit_application)
        end
        
        it "does not update the credit_application in the database" do
          put :update, id: @credit_application, credit_application: Fabricate.attributes_for(:invalid_credit_application, id: @credit_application.id), format: :json
          @credit_application.reload
          expect(@credit_application.social_security_number).not_to be_nil
        end
        
        it "renders the errors.json.rabl template" do
          put :update, id: @credit_application, credit_application: Fabricate.attributes_for(:invalid_credit_application, id: @credit_application.id), format: :json
          expect(response).to render_template :errors
        end
        
        it "responds with a 422 Unprocessable Entity status code" do
          put :update, id: @credit_application, credit_application: Fabricate.attributes_for(:invalid_credit_application, id: @credit_application.id), format: :json
          expect(response.response_code).to eq 422
        end
      end
    end
      
    context "via an automobile" do
      before :each do
        @auto = Fabricate(:automobile)
        @app1 = Fabricate(:credit_application, automobile_id: @auto.id)
        @app2 = Fabricate(:credit_application)
        @auto.save
      end
      
      it "assigns the correct automobile to @automobile" do
        put :update, automobile_id: @auto.id, id: @app1.id, format: :json
        expect(assigns(:automobile)).to eq @auto
      end
      
      context "if the credit application is associated with that specific automobile" do
        it "assigns the requested credit_application to @credit_application" do
          put :update, automobile_id: @auto.id, id: @app1.id, format: :json
          expect(assigns(:credit_application)).to eq @app1
        end
      end
      
      context "if the credit application is NOT associated with that specific automobile" do
        it "assigns nil to @credit_application" do
          put :update, automobile_id: @auto.id, id: @app2.id, format: :json
          expect(assigns(:credit_application)).to be_nil
        end
      end
    end
  end

  describe "DELETE #destroy" do
    context "with an existing credit_application" do
      before :each do
        @credit_application = Fabricate(:credit_application)
      end
  
      it "deletes the credit_application" do
        expect{ delete :destroy, id: @credit_application, format: :json }.to change(CreditApplication,:count).by(-1)
      end
    
      it "responds with a 204 No Content status code" do
        delete :destroy, id: @credit_application, format: :json
        expect(response.response_code).to eq 204
      end
    end
    
    context "with a non-existant credit_application" do
      it "responds with a 404 Not Found status code" do
        delete :destroy, id: "00000000-0000-0000-0000-000000000000", format: :json
        expect(response.response_code).to eq 404
      end
    end
    
    context "via an automobile" do
      before :each do
        @auto = Fabricate(:automobile)
        @app1 = Fabricate(:credit_application, automobile_id: @auto.id)
        @app2 = Fabricate(:credit_application)
        @auto.save
        @app1_id = @app1.id
        @app2_id = @app2.id
      end
      
      it "assigns the correct automobile to @automobile" do
        delete :destroy, automobile_id: @auto.id, id: @app1_id, format: :json
        expect(assigns(:automobile)).to eq @auto
      end
      
      context "if the credit application is associated with that specific automobile" do
        it "assigns the requested credit_application to @credit_application" do
          delete :destroy, automobile_id: @auto.id, id: @app1_id, format: :json
          expect(assigns(:credit_application)).to eq @app1
        end
        
        it "deletes the specified credit_application" do
          delete :destroy, automobile_id: @auto.id, id: @app1_id, format: :json
          app = CreditApplication.where(id: @app1_id).to_a
          expect(app).to have(0).things
        end
    
        it "responds with a 204 No Content status code" do
          delete :destroy, automobile_id: @auto.id, id: @app1_id, format: :json
          expect(response.response_code).to eq 204
        end
      end
      
      context "if the credit application is NOT associated with that specific automobile" do
        it "assigns nil to @credit_application" do
          delete :destroy, automobile_id: @auto.id, id: @app2_id, format: :json
          expect(assigns(:credit_application)).to be_nil
        end
        
        it "does NOT delete the specified credit_application" do
          delete :destroy, automobile_id: @auto.id, id: @app2_id, format: :json
          app = CreditApplication.where(id: @app2_id).to_a.first
          expect(app).to eq @app2
        end
    
        it "responds with a 404 Not Found status code" do
          delete :destroy, automobile_id: @auto.id, id: @app2_id, format: :json
          expect(response.response_code).to eq 404
        end
      end
    end
  end
end
