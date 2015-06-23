

class PostingOrder

  def initialize(posting_order_hash)
    @name, @surface, @location, @issue_date, @state, @id = posting_order_hash.values_at(:name, :surface, :location,
                                                                                        :issue_date, :state, :id)
  end

  def set_surface_and_location(surface, location)
    @surface = surface
    @location = location
  end

  def set_state(state)
    @state = state
  end

  attr_reader :name, :surface, :location, :issue_date, :state, :id

end