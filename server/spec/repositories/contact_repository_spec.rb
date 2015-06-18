require 'spec_helper'
require 'models'
require 'byebug'
require 'dal/contact_repository'

describe ContactRepository do
  before(:each) do
    @contacts_table = @db[:contacts]
    @repository = ContactRepository.new(@db)
  end

  describe '#create' do
    it 'inserts new contact into the database' do
      contact_to_save = Contact.new('Paško Patak', 'Patkogratska 22', 'Patkograd', 'California', 'USA', '90210', 'patak@fp.com', '345-5555')
      contact_saved = @repository.create(contact_to_save)
      hash_from_db = @contacts_table.where(:id => contact_saved.id).first
      contact_from_db = Contact.new(hash_from_db[:name], hash_from_db[:street_address], hash_from_db[:city],
                                    hash_from_db[:state], hash_from_db[:country], hash_from_db[:postal_code],
                                    hash_from_db[:email], hash_from_db[:phone], hash_from_db[:id])
      expect(contact_from_db).to eq(contact_saved)
    end
  end

  describe '#delete' do
    it 'deletes contact from the database by id' do
      time = Time.now
      id = @contacts_table.insert(Contact.new('Paško Patak', 'Patkogratska 22', 'Patkograd', 'California', 'USA', '90210',
                                              'patak@fp.com', '345-5555')
                                      .to_hash.merge({:created_at => time, :updated_at => time}))
      @contacts_table.insert(Contact.new('Mickey Mouse', 'Patkogratska 100', 'Patkograd', 'California', 'USA', '90210',
                                         'patak@fp.com', '345-5555')
                                 .to_hash.merge({:created_at => time, :updated_at => time}))
      @contacts_table.insert(Contact.new('Pas Pluto', 'Patkogratska 100', 'Patkograd', 'California', 'USA', '90210',
                                         'patak@fp.com', '345-5555')
                                 .to_hash.merge({:created_at => time, :updated_at => time}))
      records_deleted = @repository.delete(id)
      hash_from_db = @contacts_table.where(:id => id).first
      expect(records_deleted).to eq(1)
      expect(hash_from_db).to eq(nil)
    end
  end

  describe '#update' do
    it 'updates contact record in the database by id' do
      time = Time.now
      # db is empty, so we must create record in the db first
      id = @contacts_table.insert(Contact.new('Paško Patak', 'Patkogratska 22', 'Patkograd', 'California', 'USA',
                                              '90210', 'patak@fp.com', '345-5555')
                                      .to_hash.merge({:created_at => time, :updated_at => time}))
      # "new/changed" contact, we must provide id
      update_contact = Contact.new('Paško Patak Novi', 'Patkogratska 223334444', 'Patkograd', 'California', 'USA',
                                   '90210', 'patak@fp.com', '345-5555', id)
      records_changed = @repository.update(update_contact, id)
      hash_from_db = @contacts_table.where(:id => id).first
      contact_from_db_updated = Contact.new(hash_from_db[:name], hash_from_db[:street_address], hash_from_db[:city],
                                    hash_from_db[:state], hash_from_db[:country], hash_from_db[:postal_code],
                                    hash_from_db[:email], hash_from_db[:phone],hash_from_db[:id])
      expect(records_changed).to eq(1)
      expect(update_contact).to eq(contact_from_db_updated)

    end
  end

  describe '#get_by_id' do
    it 'gets contact record from the database by provided id' do
      time = Time.now
      contact_to_save = Contact.new('Paško Patak', 'Patkogratska 22', 'Patkograd', 'California', 'USA', '90210', 'patak@fp.com', '345-5555')
      id = @contacts_table.insert(contact_to_save.to_hash.merge({:created_at => time, :updated_at => time}))
      contact_saved = Contact.new(*contact_to_save.to_hash.merge({:id => id}).values)
      contact_get_by_id = @repository.get_by_id(contact_saved.id)
      expect(contact_saved).to eq(contact_get_by_id)
    end
  end

  describe '#get_all' do
    it 'gets all contact records from the database' do
      time = Time.now
      contact_to_save_1 = Contact.new('Paško Patak', 'Patkogratska 22', 'Patkograd', 'California', 'USA', '90210',
                                      'patak@fp.com', '345-5555')
      id = @contacts_table.insert(contact_to_save_1.to_hash.merge({:created_at => time, :updated_at => time}))
      contact_created_1 = Contact.new(*contact_to_save_1.to_hash.merge({:id => id}).values)

      contact_to_save_2 = Contact.new('Mickey Mouse', 'Patkogratska 100', 'Patkograd', 'California', 'USA', '90210',
                                      'patak@fp.com', '345-5555')
      id = @contacts_table.insert(contact_to_save_2.to_hash.merge({:created_at => time, :updated_at => time}))
      contact_created_2 = Contact.new(*contact_to_save_2.to_hash.merge({:id => id}).values)

      contact_to_save_3 = Contact.new('Pas Pluto', 'Patkogratska 100', 'Patkograd', 'California', 'USA', '90210',
                                      'patak@fp.com', '345-5555')
      id = @contacts_table.insert(contact_to_save_3.to_hash.merge({:created_at => time, :updated_at => time}))
      contact_created_3 = Contact.new(*contact_to_save_3.to_hash.merge({:id => id}).values)

      all_contacts = @repository.get_all
      expect(all_contacts).to eq([contact_created_1, contact_created_2, contact_created_3])
    end
  end
end