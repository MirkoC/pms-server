require 'json'
require 'time'

class Contact

  def table_name
    self.class.name.downcase.pluralize.to_sym
  end

  def initialize(name, street_address, city, state, country, postal_code, email, phone, id = nil)
    @name = name
    @street_address = street_address
    @city = city
    @state = state
    @country = country
    @postal_code = postal_code
    @email = email
    @phone = phone
    @id = id
  end


  attr_reader :name, :street_address, :city, :state, :country, :postal_code, :email, :phone, :id

  def ==(other)
    other.class == self.class && other.state == self.state
  end

  def state
    self.instance_variables.map { |var| self.instance_variable_get var }
  end

  def to_json(args = nil)
    {name: @name, street_address: @street_address, city: @city, state: @state, country: @country,
     postal_code: @postal_code, id: @id, email: @email, phone: @phone}.to_json
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