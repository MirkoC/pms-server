

class LocationType

  def initialize(location_type_hash)
    @type, @id = location_type_hash.values_at(:type, :id)
  end

  attr_reader :type, :id

end