

class Surface

  def initialize(surface_hash)
    @location, @price, @height, @line, @posting_orders, @type, @id = surface_hash.values_at(:location, :price, :height, :line,
                                                                                     :posting_orders, :type, :id)
    if surface_hash[:posting_orders]
      @active_posting_order = surface_hash[:posting_orders][-1]
    else
      @active_posting_order = nil
    end
    @posting_orders = surface_hash[:posting_orders] || []
  end

  def issue_posting_order(posting_order)
    posting_order.set_surface_and_location(self, @location)
    @posting_orders.push(posting_order)
    @active_posting_order = posting_order
  end

  def cancel_posting_order
    @active_posting_order = nil
  end

  def delete_posting_order(posting_order)
    if posting_order == @active_posting_order
      @active_posting_order = nil
    end
    @posting_orders.delete(posting_order)
  end

  attr_reader :location, :price, :height, :line, :posting_orders, :active_posting_order, :id

end