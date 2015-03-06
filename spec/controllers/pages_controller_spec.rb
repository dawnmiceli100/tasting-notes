require 'rails_helper'

describe PagesController do 
  context "with authenticated user" do
    before do
      set_authenticated_user
    end

    describe "GET front" do
      it "redirects to home_path" do
        get :front
        expect(response).to redirect_to(home_path)
      end  
    end  
  end 

  context "with unauthenticated user" do
    it "renders the front page" do
      get :front
      expect(response).to render_template 'pages/front'
    end  
  end   
end