require 'spec_helper'
require 'models'


describe PostingOrder do

  before(:each) do
    time = Time.now
    posting_order_hash = {:name => 'First posting order for Ivanić surface', :surface => nil, :location => nil,
                          :issue_date => time, :state => 'not yet issued', :id => nil}
    @posting_order = PostingOrder.new(posting_order_hash)
  end

  describe '#set_state' do
    it 'sets the state of execution for the posting order' do
      @posting_order.set_state('issued, not started')
      expect(@posting_order.state).to eq('issued, not started')
    end
  end

  describe '#set_surface_and_location' do
    it 'sets surface and location for posting order' do
      surface_hash = {:location => nil, :price => '100kn', :height => '4', :line => '2', :posting_orders => nil, :id => nil}
      @surface = Surface.new(surface_hash)
      location_hash = {:name => 'Ivanić lokacija', :street_address => 'Ulica 23', :city => 'Ivanić grad',
                       :state => 'Varaždinska županija', :region => 'Međimurje i Podravina', :country => 'Hrvatska',
                       :postal_code => '14000', :surfaces => nil, :id => nil}
      @location = Location.new(location_hash)
      @posting_order.set_surface_and_location(@surface, @location)
      expect(@posting_order.surface).to eq(@surface)
      expect(@posting_order.location).to eq(@location)
    end
  end

end