class Api::PostingOrdersController < ApplicationController

  def index
    @posting_orders = PostingOrder.all
  end

  def show
    @posting_order = PostingOrder.find(params[:id])
    render :show
  end

  # api/posting_orders?surface_id=5&poster_worker_id=4
  def create
    if params[:surface_id] != nil && params[:poster_worker_id] != nil
      @posting_order = PostingOrder.new(posting_order_params)
      @posting_order.save
      render :show
    end
  end

  # :id?poster_worker_id=1 if you want to switch poster worker
  def update
    if params[:surface_id] == nil
      @posting_order = PostingOrder.find(params[:id])
      @posting_order.update(posting_order_params)
      render :show
    end
  end

  def destroy
    @posting_order = PostingOrder.find(params[:id])
    @posting_order.destroy
    render :show
  end

  private
  def posting_order_params
    params.permit(:surface_id, :poster_worker_id, :issue_date, :state, :code)
  end

end
