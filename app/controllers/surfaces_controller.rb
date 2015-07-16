class SurfacesController < ApplicationController

  def index
    if (params[:timespan] != nil)
      @surfaces = Surface.most_popular(params[:timespan].to_i, params[:used_at_least].to_i)
    else
      @surfaces = Surface.all
    end
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
  def surface_params
    params.permit(:surface_number, :price, :image)
  end
end
