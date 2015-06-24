require 'spec_helper'
require 'models'


describe Location do

  before(:each) do
    location_hash = {:name => 'Ivanić lokacija', :street_address => 'Ulica 23', :city => 'Ivanić grad',
                     :state => 'Varaždinska županija', :region => 'Međimurje i Podravina', :country => 'Hrvatska',
                     :postal_code => '14000', :surfaces => nil, :type => LocationType.new({:type=>'gas station', :id => nil}), :id => nil}
    @location = Location.new(location_hash)
  end

  describe '#add_new_surface' do
    it 'adds new surface to the surfaces array' do
      surface_hash = {:location => nil, :price => '100kn', :height => '4', :line => '2'}
      surface = Surface.new(surface_hash)
      @location.add_new_surface(surface)
      expect(@location.surfaces).to eq([surface])
    end
  end


  describe '#remove_surface' do
    it 'removes given surface from surface array' do
      surface_hash = {:location => nil, :price => '100kn', :posting_orders => nil,
                      :type => SurfaceType.new({:type => 'billboard', :id => nil}), :surface_no=> 'SRF01', :id => nil}
      surface = Surface.new(surface_hash)
      @location.add_new_surface(surface)
      @location.remove_surface(surface)
      expect(@location.surfaces).to eq([])
    end
  end

end