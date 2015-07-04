class Api::CampaignsController < ApplicationController


  def index
    @campaigns = Campaign.includes(:surfaces).all
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.save
    render :show
  end

  def update
    @campaign = Campaign.find(params[:id])
    @campaign.update(campaign_params)
    render :show
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    render :show
  end

  private
  def campaign_params
    params.permit(:name_of_campaign, :start_time, :end_time)
  end
end
