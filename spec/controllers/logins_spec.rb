require 'spec_helper'

describe LoginsController do
  before :each do
    @user = Fabricate(:user)
    @login1 = Fabricate(:login, user_id: @user.id)
    @login2 = Fabricate(:login, user_id: @user.id)
    @user.save
  end
      
  describe "GET #index" do
    it "assigns the correct user to @user" do
      get :index, user_id: @user.id, format: :json
      expect(assigns(:user)).to eq @user
    end
    
    it "populates an array of Logins associated with that specific user" do
      get :index, user_id: @user.id, format: :json
      expect(assigns(:logins)).to match_array [ @login1, @login2 ]
    end
  
    it "renders the index.json.rabl template" do
      get :index, user_id: @user.id, format: :json
      expect(response).to render_template :index
    end
  
    it "responds with a 200 OK status code" do
      get :index, user_id: @user.id, format: :json
      expect(response.response_code).to eq 200
    end
  end

  describe "GET #show" do
    context "with a non-existant login" do
      it "responds with a 404 Not Found status code" do
        new_id = SecureRandom.uuid
        get :show, user_id: @user.id, id: new_id, format: :json
        expect(response.response_code).to eq 404
      end
    end
    
    it "assigns the correct user to @user" do
      get :show, user_id: @user.id, id: @login1.id, format: :json
      expect(assigns(:user)).to eq @user
    end
    
    context "if the login is associated with that specific user" do
      it "assigns the requested login to @login" do
        get :show, user_id: @user.id, id: @login1.id, format: :json
        expect(assigns(:login)).to eq @login1
      end
  
      it "renders the show.json.rabl template" do
        get :show, user_id: @user.id, id: @login1.id, format: :json
        expect(response).to render_template :show
      end
  
      it "responds with a 200 OK status code" do
        get :show, user_id: @user.id, id: @login1.id, format: :json
        expect(response.response_code).to eq 200
      end
    end
    
    context "if the login is NOT associated with that specific user" do
      before :each do
        @user2 = Fabricate(:user)
      end
      
      it "assigns nil to @login" do
        get :show, user_id: @user2.id, id: @login1.id, format: :json
        expect(assigns(:login)).to be_nil
      end
  
      it "responds with a 404 Not Found status code" do
        get :show, user_id: @user2.id, id: @login1.id, format: :json
        expect(response.response_code).to eq 404
      end
    end
  end

  describe "DELETE #destroy" do
    context "with an existing login" do
      before :each do
        @login1_id = @login1.id
        @login2_id = @login2.id
        @user2 = Fabricate(:user)
      end
  
      it "deletes the login" do
        expect{ delete :destroy, user_id: @user.id, id: @login1, format: :json }.to change(Login,:count).by(-1)
      end
    
      it "responds with a 204 No Content status code" do
        delete :destroy, user_id: @user.id, id: @login1_id, format: :json
        expect(response.response_code).to eq 204
      end
    
      it "assigns the correct user to @user" do
        delete :destroy, user_id: @user.id, id: @login1_id, format: :json
        expect(assigns(:user)).to eq @user
      end
      
      context "if the login is associated with that specific user" do
        it "assigns the requested login to @login" do
          delete :destroy, user_id: @user.id, id: @login1_id, format: :json
          expect(assigns(:login)).to eq @login1
        end
        
        it "deletes the specified login" do
          delete :destroy, user_id: @user.id, id: @login1_id, format: :json
          login = Login.where(id: @login1_id).to_a
          expect(login).to have(0).things
        end
    
        it "responds with a 204 No Content status code" do
          delete :destroy, user_id: @user.id, id: @login1_id, format: :json
          expect(response.response_code).to eq 204
        end
      end
      
      context "if the login is NOT associated with that specific user" do
        it "assigns nil to @login" do
          delete :destroy, user_id: @user2.id, id: @login2_id, format: :json
          expect(assigns(:login)).to be_nil
        end
        
        it "does NOT delete the specified login" do
          delete :destroy, user_id: @user2.id, id: @login2_id, format: :json
          login = Login.where(id: @login2_id).to_a.first
          expect(login).to eq @login2
        end
    
        it "responds with a 404 Not Found status code" do
          delete :destroy, user_id: @user2.id, id: @login2_id, format: :json
          expect(response.response_code).to eq 404
        end
      end
    end
    
    context "with a non-existant login" do
      it "responds with a 404 Not Found status code" do
        new_id = SecureRandom.uuid
        delete :destroy, user_id: @user.id, id: new_id, format: :json
        expect(response.response_code).to eq 404
      end
    end
  end
end
