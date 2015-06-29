

class SurfaceType

  def initialize(surface_type_hash)
    @name, @id = surface_type_hash.values_at(:name, :id)
  end

  attr_reader :name, :id

end