require 'json'
require 'time'

class Contact

  def table_name
    self.class.name.downcase.pluralize.to_sym
  end

  def initialize(name, street_address, city, state, country, postal_code, created_at = nil, updated_at = nil)
    @name = name
    @street_address = street_address
    @city = city
    @state = state
    @country = country
    @postal_code = postal_code
    @created_at = created_at || Time.now
    @updated_at = updated_at || Time.now
    @id = nil
  end


  attr_reader :name, :street_address, :city, :state, :country, :postal_code, :id
  attr_writer :updated_at

  def to_json
    {name: @name, street_address: @street_address, city: @city, state: @state, country: @country, postal_code: @postal_code}.to_json
  end

  def to_hash
    Hash[
        self.instance_variables.reject do |var|
          var == :'@id'
        end.map do |var|
          [var.to_s.delete("@").to_sym, self.instance_variable_get(var)]
        end
    ]
  end

end