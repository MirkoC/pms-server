require 'roar/decorator'
require 'roar/json'

class SurfaceTypeRepresenter < Roar::Decorator
  include Roar::JSON

  property :name
  property :id
end