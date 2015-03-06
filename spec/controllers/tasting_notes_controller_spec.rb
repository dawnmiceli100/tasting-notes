require 'rails_helper'

describe TastingNotesController do 
  let(:wine_type) { Fabricate(:wine_type) }
  let(:wine) { Fabricate(:wine, wine_type: wine_type) }

  context "with authenticated user" do
    before do
      set_authenticated_user
    end

    describe "GET show" do
      it "sets the @tasting_note variable" do
        tasting_note = Fabricate(:tasting_note, wine: wine, wine_type: wine_type)
        get :show, id: tasting_note.id
        expect(assigns(:tasting_note)).to eq(tasting_note)
      end

      it "sets the @wine variable" do
        tasting_note = Fabricate(:tasting_note, wine: wine, wine_type: wine_type)
        get :show, id: tasting_note.id
        expect(assigns(:wine)).to eq(wine)
      end
    end 

    describe "GET new" do
      it "sets the @tasting_note variable when the input is valid" do
        get :new, wine_id: wine.id
        expect(assigns(:tasting_note)).to be_new_record
        expect(assigns(:tasting_note)).to be_instance_of(TastingNote)
      end
    end 

    describe "POST create" do

      context "with valid input values" do
        before do
          post :create, wine_id: wine.id, tasting_note: { tasting_date: "2015-03-03 00:00:00", quality: "good", comments: "This is a good wine.", user: authenticated_user, wine: wine, wine_type: wine_type}
        end
          
        it "saves the tasting when validations are successful" do
          expect(TastingNote.count).to eq(1)
        end

        it "associates the saved tasting_note with the user" do
          expect(TastingNote.first.user).to eq(authenticated_user)
        end

        it "associates the saved tasting_note with the wine" do
          expect(TastingNote.first.wine).to eq(wine)
        end

        it "associates the saved tasting_note with the wine_type" do
          expect(TastingNote.first.wine_type).to eq(wine_type)
        end

        it "redirects_to the home_path when the tasting_note is saved" do
          expect(response).to redirect_to home_path
        end

        it "sets the success message when the tasting_note is saved" do
          expect(flash[:success]).not_to be_blank
        end 
      end 

      context "with invalid input values" do  
        it "does not create a tasting_note record" do
          post :create, wine_id: wine.id, tasting_note: { tasting_date: "", quality: "good", comments: "This is a good wine.", user: authenticated_user, wine: wine, wine_type: wine_type}
          expect(TastingNote.count).to eq(0)
        end  

        it "renders the tasting_notes/new when there are validation errors" do
          post :create, wine_id: wine.id, tasting_note: { tasting_date: "", quality: "good", comments: "This is a good wine.", user: authenticated_user, wine: wine, wine_type: wine_type}
          expect(response).to render_template 'tasting_notes/new'
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
        let(:action) { get :new, wine_id: wine.id }
      end 
    end 

    describe "POST create" do
      it_behaves_like "redirect_for_unauthenticated_user" do
        let(:action) { post :create, wine_id: 1, tasting_note: { tasting_date: "2015-03-03 00:00:00", quality: "good", comments: "This is a good wine." } }
      end  
    end   
  end  
end