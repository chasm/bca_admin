require 'spec_helper'

describe EmployersController do
  context "via a credit_application" do
    before :each do
      @app1 = Fabricate(:credit_application_with_employers)
      @app2 = Fabricate(:credit_application)
      @emp = @app1.employers.first
    end
    
    describe "GET #index" do
      it "assigns the correct credit_application to @credit_application" do
        get :index, credit_application_id: @app1.id, format: :json
        expect(assigns(:credit_application)).to eq @app1
      end
      
      it "populates an array of Employers associated with that specific credit_application" do
        get :index, credit_application_id: @app1.id, format: :json
        expect(assigns(:employers)).to match_array @app1.employers
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
      
      context "if the employer is associated with that specific credit_application" do
        it "assigns the requested employer to @emp" do
          get :show, credit_application_id: @app1.id, id: @emp.id, format: :json
          expect(@emp).not_to be_nil
          expect(assigns(:employer)).to eq @emp
        end
    
        it "renders the show.json.rabl template" do
          get :show, credit_application_id: @app1.id, id: @emp.id, format: :json
          expect(response).to render_template :show
        end
    
        it "responds with a 200 OK status code" do
          get :show, credit_application_id: @app1.id, id: @emp.id, format: :json
          expect(response.response_code).to eq 200
        end
      end
      
      context "if the employer is NOT associated with that specific credit_application" do
        it "assigns nil to @employer" do
          get :show, credit_application_id: @app2.id, id: @emp.id, format: :json
          expect(assigns(:employer)).to be_nil
        end
    
        it "responds with a 404 Not Found status code" do
          get :show, credit_application_id: @app2.id, id: @emp.id, format: :json
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
      
      context "if the employer is associated with that specific credit_application" do
        it "assigns the requested employer to @employer" do
          put :update, credit_application_id: @app1.id, id: @emp.id, format: :json
          expect(assigns(:employer)).to eq @emp
        end
      end
      
      context "if the employer is NOT associated with that specific credit_application" do
        it "assigns nil to @employer" do
          put :update, credit_application_id: @app2.id, id: @emp.id, format: :json
          expect(assigns(:employer)).to be_nil
        end
      end
    
      context "with valid attributes" do
        context "to create a new employer" do
          it "fails to locate the requested employer" do
            put :update, credit_application_id: @app2.id, id: new_id, employer: Fabricate.attributes_for(:employer, id: new_id), format: :json
            expect(assigns(:employer)).to be_nil
          end
        
          it "saves the new employer to the database" do
            put :update, credit_application_id: @app2.id, id: new_id, employer: Fabricate.attributes_for(:employer, id: new_id), format: :json
            @app2.reload
            expect(@app2.employers.first.id).to eq new_id
          end
        
          it "renders the show.json.rabl template" do
            put :update, credit_application_id: @app2.id, id: new_id, employer: Fabricate.attributes_for(:employer, id: new_id), format: :json
            expect(response).to render_template :show
          end
        
          it "responds with a 200 OK status code" do
            put :update, credit_application_id: @app2.id, id: new_id, employer: Fabricate.attributes_for(:employer, id: new_id), format: :json
            expect(response.response_code).to eq 200
          end
        end
    
        context "to update an existing employer" do
          it "locates the requested employer" do
            put :update, credit_application_id: @app1.id, id: @emp, employer: Fabricate.attributes_for(:employer, id: @emp.id), format: :json
            expect(assigns(:employer)).to eq(@emp)
          end
        
          it "saves the updated employer to the database" do
            name_of_company = "Google"
            put :update, credit_application_id: @app1.id, id: @emp, employer: Fabricate.attributes_for(:employer, id: @emp.id, name_of_company: name_of_company), format: :json
            @emp.reload
            expect(@emp.name_of_company).to eq name_of_company
          end
        
          it "responds with a 204 No Content status code" do
            put :update, credit_application_id: @app1.id, id: @emp, employer: Fabricate.attributes_for(:employer, id: @emp.id), format: :json
            expect(response.response_code).to eq 204
          end
        end
      end
    end

    context "with invalid attributes" do
      context "to create a new employer" do
        let!(:uuid) { SecureRandom.uuid }
        
        it "does not save the employer to the database" do
          expect {
            put :update, credit_application_id: @app1.id, id: uuid, employer: Fabricate.attributes_for(:invalid_employer, id: uuid), format: :json
            @app1.reload
          }.not_to change(@app1.employers, :count).by(1)
        end
        
        it "renders the errors.json.rabl template" do
          put :update, credit_application_id: @app1.id, id: uuid, employer: Fabricate.attributes_for(:invalid_employer, id: uuid), format: :json
          expect(response).to render_template :errors
        end
        
        it "responds with a 422 Unprocessable Entity status code" do
          put :update, credit_application_id: @app1.id, id: uuid, employer: Fabricate.attributes_for(:invalid_employer, id: uuid), format: :json
          expect(response.response_code).to eq 422
        end
      end
    
      context "to update an existing employer" do
        it "locates the requested employer" do
          put :update, credit_application_id: @app1.id, id: @emp, employer: Fabricate.attributes_for(:invalid_employer, id: @emp.id), format: :json
          expect(assigns(:employer)).to eq(@emp)
        end
        
        it "does not update the employer in the database" do
          put :update, credit_application_id: @app1.id, id: @emp, employer: Fabricate.attributes_for(:invalid_employer, id: @emp.id), format: :json
          @emp.reload
          expect(@emp.digits).not_to be_nil
        end
        
        it "renders the errors.json.rabl template" do
          put :update, credit_application_id: @app1.id, id: @emp, employer: Fabricate.attributes_for(:invalid_employer, id: @emp.id), format: :json
          expect(response).to render_template :errors
        end
        
        it "responds with a 422 Unprocessable Entity status code" do
          put :update, credit_application_id: @app1.id, id: @emp, employer: Fabricate.attributes_for(:invalid_employer, id: @emp.id), format: :json
          expect(response.response_code).to eq 422
        end
      end
    end
  
    describe "DELETE #destroy" do
      it "assigns the correct credit application to @credit_application" do
        get :index, credit_application_id: @app1.id, format: :json
        expect(assigns(:credit_application)).to eq @app1
      end
      
      context "if the employer is associated with that specific credit application" do
        it "assigns the requested employer to @employer" do
          delete :destroy, credit_application_id: @app1.id, id: @emp.id, format: :json
          expect(assigns(:employer)).to eq @emp
        end
        
        it "deletes the specified employer" do
          emp_id = @emp.id
          delete :destroy, credit_application_id: @app1.id, id: @emp.id, format: :json
          app = Employer.where(id: emp_id).to_a
          expect(app).to have(0).things
        end
    
        it "responds with a 204 No Content status code" do
          delete :destroy, credit_application_id: @app1.id, id: @emp.id, format: :json
          expect(response.response_code).to eq 204
        end
      end
      
      context "if the employer is NOT associated with that specific credit_application" do
        it "assigns nil to @employer" do
          delete :destroy, credit_application_id: @app2.id, id: @emp.id, format: :json
          expect(assigns(:employer)).to be_nil
        end
        
        it "does NOT delete the specified employer" do
          delete :destroy, credit_application_id: @app2.id, id: @emp.id, format: :json
          expect(@app1.employers).to include @emp
        end
    
        it "responds with a 404 Not Found status code" do
          delete :destroy, credit_application_id: @app2.id, id: @emp.id, format: :json
          expect(response.response_code).to eq 404
        end
      end
    end
  end
end
