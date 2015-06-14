require 'spec_helper'
require 'models'

RSpec.describe Contact do

  describe '#to_hash' do
    it "converts the object to a hash" do
      contact = Contact.new('Nikica Jokić',  'Mladost 3', 'Zagreb', 'Grad Zagreb', 'Hrvatska', '10000')
      expect(contact.to_hash).to eq({name: 'Nikica Jokić', street_address: 'Mladost 3', city: 'Zagreb',
                                     state: 'Grad Zagreb', country: 'Hrvatska', postal_code: '10000', created_at: Time.now,
                                     updated_at: Time.now
					})
    end
  end

  describe '#table_name' do
    it "returns the name of the table in a database (as a symbol)" do
      tab_name = Contact.new('Nikica Jokić',  'Mladost 3', 'Zagreb', 'Grad Zagreb', 'Hrvatska', '10000').table_name
      expect(tab_name).to eq(:contacts)
    end
  end

end
