class WineTypesController < ApplicationController
  before_action :require_user
  
  def show
    @wine_type = WineType.find(params[:id])
    @tasting_notes = @wine_type.tasting_notes.order(tasting_date: :desc).page(params[:page]).per(3)
  end
end