require 'singleton'
require 'sequel'
require 'models/billboard'
require 'byebug'

class BillboardRepository

  def initialize(db)
    @billboards_table = db[:billboards]
  end

  def create

  end

  def update

  end

  def get_all

  end

  def get_by_id

  end

  def delete

  end

end