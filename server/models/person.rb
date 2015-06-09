require 'json'

class Person
  def initialize(name)
    @name = name
  end

  def to_json
    { name: @name }
  end
end
