

class Surface

  def initialize(surface_hash)
    @location, @price, @posting_orders, @type, @surface_no, @id =
        surface_hash.values_at(:location, :price, :posting_orders, :type, :surface_no, :id)
    if surface_hash[:posting_orders]
      @active_posting_order = surface_hash[:posting_orders][-1]
    else
      @active_posting_order = nil
    end
    @posting_orders = surface_hash[:posting_orders] || []
  end

  def issue_posting_order(posting_order)
    posting_order.set_surface(self)
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

  attr_reader :location, :price, :type, :posting_orders, :active_posting_order, :surface_no, :id

end