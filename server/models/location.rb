


class Location

  def initialize(location_hash)
    @name, @street_address, @city, @state, @region, @country, @postal_code, @surfaces, @type, @id =
        location_hash.values_at(:name, :street_address, :city, :state, :region, :country, :postal_code, :surfaces, :type, :id )
    if @surfaces == nil
      @surfaces ||= []
    end
  end

  def add_new_surface(surface)
    @surfaces.push(surface)
  end

  def remove_surface(surface)
    @surfaces.delete(surface)
  end

  attr_reader :name, :street_address, :city, :state, :region, :country, :postal_code, :surfaces, :id

end