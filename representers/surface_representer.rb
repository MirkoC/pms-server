require 'roar/decorator'
require 'roar/json'
require 'representers/surface_type_representer'

class SurfaceRepresenter < Roar::Decorator
  include Roar::JSON

  property :location
  property :price
  property :type, class: SurfaceType, extend: SurfaceTypeRepresenter
  property :active_posting_order
  property :surface_no
  property :id
  collection :posting_orders
end