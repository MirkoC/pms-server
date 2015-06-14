require 'singleton'
require 'sequel'
require 'models/contact'
require 'byebug'
require 'helpers/contact_helper'


class ContactRepository

  def initialize(db)
    @contacts_table = db[:contacts]
  end

  def create(object)
    @contacts_table.insert(object.to_hash)
  end

  def delete(id)
    @contacts_table.where(:id => id).delete
  end

  def update(object, id)
    compare_for_update(get_by_id(id), object)
    #@contacts_table.where(:id => id).update(:name => 'monster', :street_address => 'dva')
  end

  def get_by_id(id)
    @contacts_table.where(:id => id).map {|c| c}
  end

  def get_all
    @contacts_table.select(:a).select_all.map {|c| c}
  end

end