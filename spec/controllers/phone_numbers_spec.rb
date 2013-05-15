require 'spec_helper'

describe PhoneNumbersController do
  context "via a user" do
    before :each do
      @user1 = Fabricate(:user_with_phones)
      @user2 = Fabricate(:user)
      @phone = @user1.phone_numbers.first
    end
    
    describe "GET #index" do
      it "assigns the correct user to @user" do
        get :index, user_id: @user1.id, format: :json
        expect(assigns(:user)).to eq @user1
      end
      
      it "populates an array of PhoneNumbers associated with that specific user" do
        get :index, user_id: @user1.id, format: :json
        expect(assigns(:phone_numbers)).to match_array @user1.phone_numbers
      end
    
      it "renders the index.json.rabl template" do
        get :index, user_id: @user1.id, format: :json
        expect(response).to render_template :index
      end
    
      it "responds with a 200 OK status code" do
        get :index, user_id: @user1.id, format: :json
        expect(response.response_code).to eq 200
      end
    end
  
    describe "GET #show" do
      it "assigns the correct user to @user" do
        get :index, user_id: @user1.id, format: :json
        expect(assigns(:user)).to eq @user1
      end
      
      context "if the phone number is associated with that specific user" do
        it "assigns the requested phone_number to @phone" do
          get :show, user_id: @user1.id, id: @phone.id, format: :json
          expect(@phone).not_to be_nil
          expect(assigns(:phone_number)).to eq @phone
        end
    
        it "renders the show.json.rabl template" do
          get :show, user_id: @user1.id, id: @phone.id, format: :json
          expect(response).to render_template :show
        end
    
        it "responds with a 200 OK status code" do
          get :show, user_id: @user1.id, id: @phone.id, format: :json
          expect(response.response_code).to eq 200
        end
      end
      
      context "if the phone number is NOT associated with that specific user" do
        it "assigns nil to @phone_number" do
          get :show, user_id: @user2.id, id: @phone.id, format: :json
          expect(assigns(:phone_number)).to be_nil
        end
    
        it "responds with a 404 Not Found status code" do
          get :show, user_id: @user2.id, id: @phone.id, format: :json
          expect(response.response_code).to eq 404
        end
      end
    end
  
    describe "PUT #update" do
      let!(:new_id) { SecureRandom.uuid }
      
      it "assigns the correct user to @user" do
        get :index, user_id: @user1.id, format: :json
        expect(assigns(:user)).to eq @user1
      end
      
      context "if the phone number is associated with that specific user" do
        it "assigns the requested phone_number to @phone_number" do
          put :update, user_id: @user1.id, id: @phone.id, format: :json
          expect(assigns(:phone_number)).to eq @phone
        end
      end
      
      context "if the phone number is NOT associated with that specific user" do
        it "assigns nil to @phone_number" do
          put :update, user_id: @user2.id, id: @phone.id, format: :json
          expect(assigns(:phone_number)).to be_nil
        end
      end
    
      context "with valid attributes" do
        context "to create a new phone number" do
          it "fails to locate the requested phone number" do
            put :update, user_id: @user2.id, id: new_id, phone_number: Fabricate.attributes_for(:phone_number, id: new_id), format: :json
            expect(assigns(:phone_number)).to be_nil
          end
        
          it "saves the new phone number to the database" do
            put :update, user_id: @user2.id, id: new_id, phone_number: Fabricate.attributes_for(:phone_number, id: new_id), format: :json
            @user2.reload
            expect(@user2.phone_numbers.first.id).to eq new_id
          end
        
          it "renders the show.json.rabl template" do
            put :update, user_id: @user2.id, id: new_id, phone_number: Fabricate.attributes_for(:phone_number, id: new_id), format: :json
            expect(response).to render_template :show
          end
        
          it "responds with a 200 OK status code" do
            put :update, user_id: @user2.id, id: new_id, phone_number: Fabricate.attributes_for(:phone_number, id: new_id), format: :json
            expect(response.response_code).to eq 200
          end
        end
    
        context "to update an existing phone number" do
          it "locates the requested phone number" do
            put :update, user_id: @user1.id, id: @phone, phone_number: Fabricate.attributes_for(:phone_number, id: @phone.id), format: :json
            expect(assigns(:phone_number)).to eq(@phone)
          end
        
          it "saves the updated phone number to the database" do
            num = "222-333-4444"
            put :update, user_id: @user1.id, id: @phone, phone_number: Fabricate.attributes_for(:phone_number, id: @phone.id, digits: num), format: :json
            @phone.reload
            expect(@phone.digits).to eq num
          end
        
          it "responds with a 204 No Content status code" do
            put :update, user_id: @user1.id, id: @phone, phone_number: Fabricate.attributes_for(:phone_number, id: @phone.id), format: :json
            expect(response.response_code).to eq 204
          end
        end
      end
    end

    context "with invalid attributes" do
      context "to create a new phone number" do
        let!(:uuid) { SecureRandom.uuid }
        
        it "does not save the phone number to the database" do
          expect {
            put :update, user_id: @user1.id, id: uuid, phone_number: Fabricate.attributes_for(:invalid_phone_number, id: uuid), format: :json
            @user1.reload
          }.not_to change(@user1.phone_numbers, :count).by(1)
        end
        
        it "renders the errors.json.rabl template" do
          put :update, user_id: @user1.id, id: uuid, phone_number: Fabricate.attributes_for(:invalid_phone_number, id: uuid), format: :json
          expect(response).to render_template :errors
        end
        
        it "responds with a 422 Unprocessable Entity status code" do
          put :update, user_id: @user1.id, id: uuid, phone_number: Fabricate.attributes_for(:invalid_phone_number, id: uuid), format: :json
          expect(response.response_code).to eq 422
        end
      end
    
      context "to update an existing phone number" do
        it "locates the requested phone number" do
          put :update, user_id: @user1.id, id: @phone, phone_number: Fabricate.attributes_for(:invalid_phone_number, id: @phone.id), format: :json
          expect(assigns(:phone_number)).to eq(@phone)
        end
        
        it "does not update the phone number in the database" do
          put :update, user_id: @user1.id, id: @phone, phone_number: Fabricate.attributes_for(:invalid_phone_number, id: @phone.id), format: :json
          @phone.reload
          expect(@phone.digits).not_to be_nil
        end
        
        it "renders the errors.json.rabl template" do
          put :update, user_id: @user1.id, id: @phone, phone_number: Fabricate.attributes_for(:invalid_phone_number, id: @phone.id), format: :json
          expect(response).to render_template :errors
        end
        
        it "responds with a 422 Unprocessable Entity status code" do
          put :update, user_id: @user1.id, id: @phone, phone_number: Fabricate.attributes_for(:invalid_phone_number, id: @phone.id), format: :json
          expect(response.response_code).to eq 422
        end
      end
    end
  
    describe "DELETE #destroy" do
      it "assigns the correct user to @user" do
        get :index, user_id: @user1.id, format: :json
        expect(assigns(:user)).to eq @user1
      end
      
      context "if the phone number is associated with that specific user" do
        it "assigns the requested phone number to @phone_number" do
          delete :destroy, user_id: @user1.id, id: @phone.id, format: :json
          expect(assigns(:phone_number)).to eq @phone
        end
        
        it "deletes the specified phone number" do
          phone_id = @phone.id
          delete :destroy, user_id: @user1.id, id: @phone.id, format: :json
          nums = PhoneNumber.where(id: phone_id).to_a
          expect(nums).to have(0).things
        end
    
        it "responds with a 204 No Content status code" do
          delete :destroy, user_id: @user1.id, id: @phone.id, format: :json
          expect(response.response_code).to eq 204
        end
      end
      
      context "if the phone number is NOT associated with that specific user" do
        it "assigns nil to @phone_number" do
          delete :destroy, user_id: @user2.id, id: @phone.id, format: :json
          expect(assigns(:phone_number)).to be_nil
        end
        
        it "does NOT delete the specified phone number" do
          delete :destroy, user_id: @user2.id, id: @phone.id, format: :json
          expect(@user1.phone_numbers).to include @phone
        end
    
        it "responds with a 404 Not Found status code" do
          delete :destroy, user_id: @user2.id, id: @phone.id, format: :json
          expect(response.response_code).to eq 404
        end
      end
    end
  end
end
