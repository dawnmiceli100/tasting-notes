require 'rails_helper'

describe WinesController do 
  let(:wine_type) { Fabricate(:wine_type) } 

  context "with authenticated user" do
    before do
      set_authenticated_user
    end

    describe "GET show" do
      it "sets the @wine variable" do
        wine = Fabricate(:wine, wine_type: wine_type)
        get :show, id: wine.id
        expect(assigns(:wine)).to eq(wine)
      end
    end  

    describe 'GET new' do
      it "sets the @wine variable when the input is valid" do
        get :new
        expect(assigns(:wine)).to be_new_record
        expect(assigns(:wine)).to be_instance_of(Wine)
      end
    end  

    describe "POST create" do

      context "with valid input values" do
        before do
          post :create, wine: { description: "Baron de Ley", vintage: 2006, wine_type_id: wine_type.id }
        end
          
        it "saves the wine when validations are successful" do
          expect(Wine.count).to eq(1)
        end

        it "associates the saved wine with the wine_type" do
          expect(Wine.first.wine_type).to eq(wine_type)
        end

        it "redirects_to the new_wine_tasting_note_path when the wine is saved" do
          expect(response).to redirect_to new_wine_tasting_note_path(Wine.first)
        end

        it "sets the success message when the wine is saved" do
          expect(flash[:success]).not_to be_blank
        end 
      end 

      context "with invalid input values" do  
        it "does not create a Wine record" do
          post :create, wine: { description: "", vintage: 2006, wine_type_id: wine_type.id }
          expect(Wine.count).to eq(0)
        end  

        it "renders the wines/new when there are validation errors" do
          post :create, wine: { description: "", vintage: 2006, wine_type_id: wine_type.id }
          expect(response).to render_template 'wines/new'
        end  
      end  
    end    
  end  
  
  context "with unauthenticated user" do
    describe "GET show" do
      it_behaves_like "redirect_for_unauthenticated_user" do
        let(:action) { get :show, id: 1 }
      end 
    end   

    describe "GET new" do
      it_behaves_like "redirect_for_unauthenticated_user" do
        let(:action) { get :new }
      end 
    end 

    describe "POST create" do
      it_behaves_like "redirect_for_unauthenticated_user" do
        let(:action) { post :create, wine: { description: "", vintage: 2006, wine_type_id: wine_type.id } }
      end  
    end  
  end       
end