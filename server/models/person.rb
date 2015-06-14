require 'json'

class Person

  def initialize(first_name, last_name, id)
    @first_name = first_name
    @last_name = last_name
    if (id == nil)
      @id = SecureRandom.uuid
    else
      @id = id
    end
  end
  
  attr_reader :first_name, :last_name, :id

  def to_json
    { first_name: @first_name, last_name: @last_name, id: @id }.to_json
  end


end
