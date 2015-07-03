class LocationsController < ApplicationController

  def index
    @locations = Location.includes(:surfaces).all
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(location_params)
    @location.save
    render :show
  end

  def update
    @location = Location.find(params[:id])
    @location.update(location_params)
    render :show
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    render :show
  end

  private
  def location_params
    params.permit(:name, :street_address, :city, :state, :region, :country, :postal_code)
  end
end
