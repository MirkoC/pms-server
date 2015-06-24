require 'spec_helper'
require 'models'
require 'byebug'

describe Contact do

  describe '#state' do
    it 'converts the object attribute values to an array' do
      contact = Contact.new('Nikica Jokić',  'Mladost 3', 'Zagreb', 'Grad Zagreb', 'Hrvatska', '10000', 'nikica@fp.com', '555-4555')
      expect(contact.state).to eq(['Nikica Jokić', 'Mladost 3', 'Zagreb', 'Grad Zagreb', 'Hrvatska', '10000', 'nikica@fp.com', '555-4555', nil])
    end
  end

  describe '#==' do
    it 'compares two Contact objects by attribute equality' do
      contact1 = Contact.new('Nikica Jokić',  'Mladost 3', 'Zagreb', 'Grad Zagreb', 'Hrvatska', '10000', 'nikica@fp.com', '555-4555')
      contact2 = Contact.new('Nikica Jokić',  'Mladost 3', 'Zagreb', 'Grad Zagreb', 'Hrvatska', '10000', 'nikica@fp.com', '555-4555')
      expect(contact1).to eq(contact2)
    end
  end

  describe '#to_hash' do
    it 'converts the object to a hash' do
      contact = Contact.new('Nikica Jokić',  'Mladost 3', 'Zagreb', 'Grad Zagreb', 'Hrvatska', '10000', 'nikica@fp.com', '555-4555')
      expect(contact.to_hash).to eq({name: 'Nikica Jokić', street_address: 'Mladost 3', city: 'Zagreb',
                                     state: 'Grad Zagreb', country: 'Hrvatska', postal_code: '10000',
                                     email: 'nikica@fp.com', phone: '555-4555'})
      end
  end

  describe '#table_name' do
    it 'returns the name of the table in a database (as a symbol)' do
      tab_name = Contact.new('Nikica Jokić',  'Mladost 3', 'Zagreb', 'Grad Zagreb', 'Hrvatska', '10000', 'nikica@fp.com', '555-4555').table_name
      expect(tab_name).to eq(:contacts)
    end
  end

end
