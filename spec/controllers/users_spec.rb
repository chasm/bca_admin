require 'spec_helper'

describe UsersController do
  let!(:auto) { Fabricate(:user) }
  subject { auto }
  
  describe "GET #index" do
    it "populates an array of Users" do
      get :index, format: :json
      expect(assigns(:users)).to match_array [auto]
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
    context "with an existing user" do
      it "assigns the requested user to @user" do
        get :show, id: auto.id, format: :json
        expect(assigns(:user)).to eq auto
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
    
    context "with a non-existant user" do
      it "responds with a 404 Not Found status code" do
        get :show, id: "00000000-0000-0000-0000-000000000000", format: :json
        expect(response.response_code).to eq 404
      end
    end
  end

  describe "PUT #update" do
    before :each do
      @user = Fabricate(:user, name_first: "Bob", name_last: "Dole", email: "bob@dole.com")
    end
    
    context "with valid attributes" do
      context "to create a new user" do
        it "fails to locate the requested user" do
          put :update, id: "00000000-0000-0000-0000-000000000000", contact: Fabricate.attributes_for(:user), format: :json
          expect(assigns(:user)).not_to eq(@user)
        end
        
        it "saves the new user to the database" do
          uuid = SecureRandom.uuid
          expect {
            put :update, id: uuid, user: Fabricate.attributes_for(:user, id: uuid), format: :json
          }.to change(User,:count).by(1)
        end
        
        it "renders the show.json.rabl template" do
          uuid = SecureRandom.uuid
          put :update, id: uuid, user: Fabricate.attributes_for(:user, id: uuid), format: :json
          expect(response).to render_template :show
        end
        
        it "responds with a 200 OK status code" do
          uuid = SecureRandom.uuid
          put :update, id: uuid, user: Fabricate.attributes_for(:user, id: uuid), format: :json
          expect(response.response_code).to eq 200
        end
      end
    
      context "to update an existing user" do
        it "locates the requested user" do
          put :update, id: @user, user: Fabricate.attributes_for(:user, id: @user.id), format: :json
          expect(assigns(:user)).to eq(@user)
        end
        
        it "saves the updated user to the database" do
          mi = "G"
          put :update, id: @user, user: Fabricate.attributes_for(:user, id: @user.id, name_mi: mi), format: :json
          @user.reload
          expect(@user.name_mi).to eq mi
        end
        
        it "responds with a 204 No Content status code" do
          put :update, id: @user, user: Fabricate.attributes_for(:user, id: @user.id), format: :json
          expect(response.response_code).to eq 204
        end
      end
    end

    context "with invalid attributes" do
      context "to create a new user" do
        let(:uuid) { SecureRandom.uuid }
        it "does not save the user to the database" do
          expect {
            put :update, id: uuid, user: Fabricate.attributes_for(:invalid_user, id: uuid), format: :json
          }.not_to change(User,:count).by(1)
        end
        
        it "renders the errors.json.rabl template" do
          put :update, id: uuid, user: Fabricate.attributes_for(:invalid_user, id: uuid), format: :json
          expect(response).to render_template :errors
        end
        
        it "responds with a 422 Unprocessable Entity status code" do
          put :update, id: uuid, user: Fabricate.attributes_for(:invalid_user, id: uuid), format: :json
          expect(response.response_code).to eq 422
        end
      end
    
      context "to update an existing user" do
        it "locates the requested user" do
          put :update, id: @user, user: Fabricate.attributes_for(:invalid_user, id: @user.id), format: :json
          expect(assigns(:user)).to eq(@user)
        end
        
        it "does not update the user in the database" do
          put :update, id: @user, user: Fabricate.attributes_for(:invalid_user, id: @user.id), format: :json
          @user.reload
          expect(@user.email).not_to be_nil
        end
        
        it "renders the errors.json.rabl template" do
          put :update, id: @user, user: Fabricate.attributes_for(:invalid_user, id: @user.id), format: :json
          expect(response).to render_template :errors
        end
        
        it "responds with a 422 Unprocessable Entity status code" do
          put :update, id: @user, user: Fabricate.attributes_for(:invalid_user, id: @user.id), format: :json
          expect(response.response_code).to eq 422
        end
      end
    end
  end

  describe "DELETE #destroy" do
    context "with an existing user" do
      before :each do
        @user = Fabricate(:user)
      end
  
      it "deletes the user" do
        expect{ delete :destroy, id: @user, format: :json }.to change(User,:count).by(-1)
      end
    
      it "responds with a 204 No Content status code" do
        delete :destroy, id: @user, format: :json
        expect(response.response_code).to eq 204
      end
    end
    
    context "with a non-existant user" do
      it "responds with a 404 Not Found status code" do
        delete :destroy, id: "00000000-0000-0000-0000-000000000000", format: :json
        expect(response.response_code).to eq 404
      end
    end
  end
end
