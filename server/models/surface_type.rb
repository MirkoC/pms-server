

class SurfaceType

  def initialize(surface_type_hash)
    @type, @id = surface_type_hash.values_at(:type, :id)
  end

  attr_reader :type, :id

end