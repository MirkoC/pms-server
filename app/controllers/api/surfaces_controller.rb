class Api::SurfacesController < ApplicationController

  def index
    @surfaces = Surface.all
  end

  def show
    @surface = Surface.find(params[:id])
    render :show
  end

  def create
    @location = Location.find(params[:location_id])
    @surface = @location.surfaces.create(surface_params)
    render :show
  end

  def update
    @surface = Surface.find(params[:id])
    @surface.update(surface_params)
    render :show
  end

  def destroy
    @surface = Surface.find(params[:id])
    @surface.destroy
    render :show
  end


  private
  def search_params

  end
  def surface_params
    params.permit(:surface_number, :price, :image)
  end

end
