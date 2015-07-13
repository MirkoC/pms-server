class Api::CampaignsController < Api::BaseController

  before_action :authenticate_user!

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

  # ovo treba mijenjati, previše puta ide u bazu
  def add
    @surfaces ||= []
    params[:surface_ids].each do |id|
      @surfaces.push(Surface.find(id))
    end
    @campaign = Campaign.find(params[:campaign_id])
    @campaign.add_surfaces(@surfaces)
    render :show
  end

  private
  def campaign_params
    params.permit(:name_of_campaign, :start_time, :end_time)
  end
end
