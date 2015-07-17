class Api::SurfaceTypesController < Api::BaseController

  #before_action :authenticate_user!

  def index
    @surface_types = SurfaceType.all
  end

  def show
    @surface_type = SurfaceType.find(params[:id])
  end

  def create
    @surface_type = SurfaceType.new(surface_type_params)
    @surface_type.save
    render :show
  end

  def update
    @surface_type = SurfaceType.find(params[:id])
    @surface_type.update(surface_type_params)
    render :show
  end

  def destroy
    @surface_type = SurfaceType.find(params[:id])
    @surface_type.destroy
    render :show
  end


  private
  def surface_type_params
    params.permit(:name)
  end
end
