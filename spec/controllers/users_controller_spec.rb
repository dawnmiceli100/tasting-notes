require 'rails_helper'

describe UsersController do 

  describe 'GET new' do
    it "sets the @user variable when the input is valid" do
      get :new
      expect(assigns(:user)).to be_new_record
      expect(assigns(:user)).to be_instance_of(User)
    end
  end  

  describe "POST create" do

    context "with valid input" do
      before do
        post :create, user: { full_name: "Jane Doe", email: "jane@example.com", password: "password"}
      end  

      it "creates a User record" do
        expect(User.last.full_name).to eq("Jane Doe") 
      end
      
      it "redirects to sign_in_path" do
        expect(response).to redirect_to sign_in_path
      end
    end  

    context "with invalid input" do

      it "does not create a User record" do
        expect {
          post :create, user: { full_name: "", email: "jane@example.com", password: "password" }
        }.to change { User.count }.by 0  
      end  

      it "sets the @user variable" do
        post :create, user: { full_name: "", email: "jane@example.com", password: "password" }
        expect(assigns(:user)).to be_new_record
        expect(assigns(:user)).to be_instance_of(User)
      end  

      it "renders the new template" do
        post :create, user: { full_name: "", email: "jane@example.com", password: "password" }
        expect(response).to render_template('new')
      end  
    end  
  end   
end