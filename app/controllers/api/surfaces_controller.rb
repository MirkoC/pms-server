class Api::SurfacesController < ApplicationController

  def index

  end

  def show
    @surface = Surface.find(params[:id])
  end

  def create
    @location = Location.find(params[:location_id])
    Rails.logger.debug "->>>>>>>>>>>>>>>>> + #{params[:image]}"
    @surface = @location.surfaces.create(surface_params)
    render :show
  end

  def update

  end

  def destroy

  end

  private
  def surface_params
    params.permit(:surface_number, :price, :image)
  end

end
