require 'spec_helper'

describe Contract do

  before(:each) do
    time_start = Time.now
    time_end = Time.now + (2*7*24*60*60)
    contract_hash = {:name => 'New Erste contract', :start_time => time_start, :end_time => time_end, :surfaces => nil, :id => nil}
    @contract = Contract.new(contract_hash)
    surface_hash = {:location => nil, :price => '100kn', :posting_orders => nil,
                    :type => SurfaceType.new({:type => 'billboard', :id => nil}), :surface_no=> 'SRF01', :id => nil}
    @surface = Surface.new(surface_hash)
  end

  describe '#add_surfaces' do
    it 'sets surfaces to a new contract, the list will be unique' do
      @contract.add_surfaces([@surface, @surface])
      expect(@contract.surfaces).to eq([@surface])
    end
  end

end