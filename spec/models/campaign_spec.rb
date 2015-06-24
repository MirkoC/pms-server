require 'spec_helper'
require 'models'


describe Campaign do

  before(:each) do
    time_start = Time.now
    time_end = Time.now + (2*7*24*60*60)
    campaign_hash = {:name => 'New Erste Campaign', :start_time => time_start, :end_time => time_end, :surfaces => nil, :id => nil}
    @campaign = Campaign.new(campaign_hash)
    surface_hash = {:location => nil, :price => '100kn', :posting_orders => nil,
                    :type => SurfaceType.new({:type => 'billboard', :id => nil}), :surface_no=> 'SRF01', :id => nil}
    @surface = Surface.new(surface_hash)
  end

  describe '#add_surfaces' do
    it 'sets surfaces to a new campaign, the list will be unique' do
      @campaign.add_surfaces([@surface, @surface])
      expect(@campaign.surfaces).to eq([@surface])
    end
  end

end