require 'singleton'
require 'sequel'
require 'models/contact'
require 'byebug'

class ContactRepository

  def initialize(db)
    @contacts_table = db[:contacts]
  end

  def create(contact)
    time = Time.now
    id = @contacts_table.insert(contact.to_hash.merge({:created_at => time, :updated_at => time}))
    Contact.new(*contact.to_hash.merge({:id => id}).values)
  end

  def delete(id)
    @contacts_table.where(:id => id).delete
  end

  def update(object, id)
    @contacts_table.where(:id => id).update(object.to_hash.merge({:updated_at => Time.now}))
  end

  def get_by_id(id)
    c = @contacts_table.where(:id => id).first
    Contact.new(c[:name], c[:street_address],  c[:city], c[:state], c[:country], c[:postal_code], c[:id])
  end

  def get_all
    @contacts_table.select(:a).select_all.map do |c|
      Contact.new(c[:name], c[:street_address],  c[:city], c[:state], c[:country], c[:postal_code], c[:id])
    end
  end

end