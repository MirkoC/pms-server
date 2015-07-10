class Api::PosterWorkersController < ApplicationController

  before_action :authenticate_user!

  def index
    @poster_workers = PosterWorker.all
  end

  def show
    @poster_worker = PosterWorker.find(params[:id])
    render :show
  end

  def create
    @poster_worker = PosterWorker.new(poster_worker_params)
    @poster_worker.save
    render :show
  end

  def update
    @poster_worker = PosterWorker.find(params[:id])
    @poster_worker.update(poster_worker_params)
    render :show
  end

  def destroy
    @poster_worker = PosterWorker.find(params[:id])
    @poster_worker.destroy
    render :show
  end


  private
  def poster_worker_params
    params.permit(:name, :street_address, :city, :state, :country, :postal_code, :email, :phone)
  end

end
