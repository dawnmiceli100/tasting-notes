require 'rails_helper'

describe WineTypesController do 
  context "with authenticated user" do
    before do
      set_authenticated_user
    end

    describe "GET show" do
      it "sets the @wine_type variable" do
        wine_type = Fabricate(:wine_type)
        get :show, id: wine_type.id
        expect(assigns(:wine_type)).to eq(wine_type)
      end
    end  
  end 

  context "with unauthenticated user" do
    describe "GET show" do
      it_behaves_like "redirect_for_unauthenticated_user" do
        let(:action) { get :show, id: 1 }
      end 
    end  
  end  
end