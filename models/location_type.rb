

class LocationType

  def initialize(location_type_hash)
    @name, @id = location_type_hash.values_at(:type, :id)
  end

  attr_reader :name, :id

end