require 'rails_helper'

describe SessionsController do 
  context "user is signed in" do
    before { set_authenticated_user }
      
    describe "DELETE destroy" do
      before { delete :destroy }

      it "sets session[:user_id] to nil" do
        expect(session[:user_id]).to eq nil
      end

      it { is_expected.to redirect_to root_path }

      it { is_expected.to set_flash[:success] }
    
    end  
  end

  context "user is not signed in" do

    describe "POST create" do
      let(:user) { Fabricate(:user) }

      context "with valid email and password" do
        before { post :create, email: user.email, password: user.password } 
        
        it "sets session[:user_id]" do
          expect(session[:user_id]).to eq user.id
        end 

        it { is_expected.to redirect_to home_path }

        it { is_expected.to set_flash[:success] }
      end  

      context "with invalid email and/or password" do
        it "sets session[:user_id] to nil" do
          post :create, email: 'email', password: user.password
          expect(session[:user_id]).to eq nil
        end 

        it "redirects to sign_in_path when user enters invalid email" do
          post :create, email: 'email', password: user.password
          expect(response).to redirect_to sign_in_path
        end  

        it "redirects to sign_in_path when user enters invalid password" do
          post :create, email: user.email, password: "invalid"
          expect(response).to redirect_to sign_in_path
        end 

        it "sets the danger message" do
          post :create, email: user.email, password: "invalid"
          expect(flash[:danger]).not_to be_blank
        end  
      end  
    end  
  end  
end