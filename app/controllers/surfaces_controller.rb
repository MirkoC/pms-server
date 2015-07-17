class SurfacesController < ApplicationController

  def index
    if (params[:timespan] != nil)
      @surfaces = Surface.most_popular(params[:timespan].to_i, params[:used_at_least].to_i)
    else
      @surfaces = Surface.includes(:surface_type).all
    end
  end

  def show
    @surface = Surface.find(params[:id])
  end

  def new
  end

  def create
    @surface = Surface.new(surface_params)
    if @surface.save
      redirect_to @surface
    else
      render 'new'
    end
  end

  def edit
    @surface = Surface.find(params[:id])
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
    params.require(:surface).permit(:code, :price, :image, :location_id, :surface_type_id)
  end

end
