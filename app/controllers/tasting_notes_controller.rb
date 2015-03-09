class TastingNotesController < ApplicationController
  before_action :require_user
  before_action :set_wine, only: [:new, :create]

  def index
    @tasting_notes = TastingNote.order(tasting_date: :desc)
  end  

  def show
    @tasting_note = TastingNote.find(params[:id])
    @wine = @tasting_note.wine
  end
    
  def new
    @tasting_note = TastingNote.new
  end  

  def create
    @tasting_note = TastingNote.new(tasting_note_params)
    @tasting_note.user = current_user
    @tasting_note.wine = @wine
    @tasting_note.wine_type = @wine.wine_type

    if @tasting_note.save
      flash[:success] = "Your tasting note has been saved."
      redirect_to home_path
    else
      render :new  
    end  
  end
  
  private

  def tasting_note_params
    params.require(:tasting_note).permit(:tasting_date, :color, :color_intensity, :clarity, :aroma_intensity, :sweetness, :acidity, :tannin, :body, :finish, :quality, :flavor_intensity, :comments, flavor_ids: [], aroma_ids: [])
  end  

  def set_wine
    @wine = Wine.find(params[:wine_id])
  end
    
end
  