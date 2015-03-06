class WineTypesController < ApplicationController
  before_action :require_user
  
  def show
    @wine_type = WineType.find(params[:id])
  end
end