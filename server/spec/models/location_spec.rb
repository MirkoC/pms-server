require 'spec_helper'
require 'models'
require 'byebug'

describe Location do

  describe '#state' do
    it 'converts the object attribute values to an array' do
      time = Time.now
      billboard_hash = {:location => 'location', :price => '100kn', :rent => '200kn', :direction => 'parallel', :height => '2m',
                        :line => '2', :date_of_setting => time, :date_of_dismantling => time, :sales_started => time,
                        :sales_ended => time, :taken_off => time, :taken_until => time, :remark => 'Very good billboard',
                        :frame => true, :lighted => true, :gas_station => false, :shopping_centers => true,
                        :tram_bus_stop => false, :prohibition_of_alcohol => true, :prohibition_of_tobacco => true,
                        :political_restrictions => false, :other_restrictions => false}
      billboard = Billboard.new(billboard_hash)
      billboards ||= []
      billboards.push(billboard)
      location_hash = {:latitude => '16.11', :longitude => '48.22', :name_of_location => 'Donja Zelina - Sveti Ivan Zelina',
                       :company => 'Outdoor', :street_address => 'Sveti Ivan Zelina', :city => 'Donja Zelina',
                       :state => 'Varaždinska županija', :region => 'Međimurje i Podravina', :country => 'Hrvatska',
                       :contract => 'ugovor', :jurisdiction => 'Hrvatske Ceste', :billboard_worker => 'Željko',
                       :date_of_permit_expiration => time, :electricity_paid => false, :billboards => billboards}

      location = Location.new(location_hash)

      expect(location.state).to eq(['16.11', '48.22', 'Donja Zelina - Sveti Ivan Zelina', 'Outdoor', 'Sveti Ivan Zelina', 'Donja Zelina',
                              'Varaždinska županija', 'Međimurje i Podravina', 'Hrvatska', 'ugovor', 'Hrvatske Ceste',
                              'Željko', time, false, billboards, nil])
    end
  end

  describe '#==' do
    it 'compares two Location objects by attribute equality' do
      time = Time.now
      location_hash = {:latitude => '16.11', :longitude => '48.22', :name_of_location => 'Donja Zelina - Sveti Ivan Zelina',
                       :company => 'Outdoor', :street_address => 'Sveti Ivan Zelina', :city => 'Donja Zelina',
                       :state => 'Varaždinska županija', :region => 'Međimurje i Podravina', :country => 'Hrvatska',
                       :contract => 'ugovor', :jurisdiction => 'Hrvatske Ceste', :billboard_worker => 'Željko',
                       :date_of_permit_expiration => time, :electricity_paid => false}
      location1 = Location.new(location_hash)
      location2 = Location.new(location_hash)
      expect(location1).to eq(location2)
    end
  end

end