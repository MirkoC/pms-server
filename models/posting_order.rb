

class PostingOrder

  def initialize(posting_order_hash)
    @surface, @issue_date, @state, @posting_order_no, @poster_worker, @id =
        posting_order_hash.values_at(:surface, :issue_date, :state, :posting_order_no, :poster_worker, :id)
  end

  def set_surface_and_location(surface)
    @surface = surface
  end

  def set_state(state)
    @state = state
  end

  attr_reader :posting_order_no, :surface, :issue_date, :state, :id

end