

class PostingOrder

  def initialize(posting_order_hash)
    @surface, @issue_date, @state, @posting_order_no, @id =
        posting_order_hash.values_at(:surface, :issue_date, :state, :posting_order_no, :id)
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