class WinesController < ApplicationController
  before_action :require_user

  def show
    @wine = Wine.find(params[:id])
  end
    
  def new
    @wine = Wine.new
  end 

  def create
    @wine = Wine.new(wine_params)

    if @wine.save
      flash[:success]  = "#{@wine.vintage} #{@wine.description} has been successfully added."
      redirect_to new_wine_tasting_note_path(@wine)
    else
      render 'new'
    end
  end

  def wine_params
    params.require(:wine).permit(:description, :vintage, :wine_type_id)
  end  

end  