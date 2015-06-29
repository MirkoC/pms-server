require 'models'
require 'sequel'


class ContactsSeeder
  def seed
    contacts ||= []
    contacts.push(Contact.new('Nikica Jokić',  'Mladost 3', 'Zagreb', 'Grad Zagreb', 'Hrvatska', '10000', 'nikica@fp.com', '555-4555'))
    contacts.push(Contact.new('Mirko Cerovac', 'Selska 23', 'Zagreb', 'Grad Zagreb', 'Hrvatska', '10000', 'mirko@fp.com', '555-6555'))
    contacts.push(Contact.new('Veljko Dragšić', 'Trešnjevka 7', 'Zagreb', 'Grad Zagreb', 'Hrvatska', '10000', 'veljko@fp.com', '555-3555'))
    contacts
  end
end

class DataSeeder
  def seed_surface_types
    surface_types ||= []
    surface_types.push(SurfaceType.new({:name => 'billboard'}))
    surface_types.push(SurfaceType.new({:name => 'city light'}))
  end
  def seed_location_types
    location_types ||= []
    location_types.push(LocationType.new({:name => 'highway'}))
    location_types.push(LocationType.new({:name => 'gas station'}))
    location_types.push(LocationType.new({:name => 'shopping center'}))
  end
  #def seed_locations
  #  locations ||= []
  #  locations.push(Location.new(:name => 'Prva lokacija', :street_address => 'Preradovićeva 40', :city => 'Zagreb',
  #                              :state => 'Grad Zagreb', :region => 'Grad Zagreb i okolni region', :country => 'Hrvatska', :postal_code => '10000'))
  #end
end