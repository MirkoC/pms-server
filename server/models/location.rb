

class Location

  def table_name
    self.class.name.downcase.pluralize.to_sym
  end

  def initialize(location_hash, id = nil)
    # fali jedan, ne vidim pročitati što je
    @latitude, @longitude, @name_of_location, @company, @street_address, @city, @state, @region, @country, @contract, @jurisdiction,
        @billboard_worker, @date_of_permit_expiration, @electricity_paid, @billboards =
        location_hash.values_at(:latitude, :longitude, :name_of_location, :company, :street_address, :city, :state, :region, :country,
                                :contract, :jurisdiction, :billboard_worker, :date_of_permit_expiration, :electricity_paid, :billboards)
    @id = id
  end

  attr_reader :latitude, :longitude, :name_of_location, :company, :street_address, :city, :state, :region, :country,
              :contract, :jurisdiction, :billboard_worker, :date_of_permit_expiration, :electricity_paid, :billboards, :id

  def ==(other)
    other.class == self.class && other.state == self.state
  end

  def state
    self.instance_variables.map { |var| self.instance_variable_get var }
  end

end