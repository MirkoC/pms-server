

class Surface

  def table_name
    self.class.name.downcase.pluralize.to_sym
  end

  def initialize(surface_hash, id = nil, posting_orders = nil)
    @location, @price, @height, @line = surface_hash.values_at(:location, :price, :height, :line)
    @posting_orders = [] || posting_orders
    if posting_orders
      @active_posting_order = posting_orders[-1]
    else
      @active_posting_order = nil
    end
    @id = id
  end

  def new_posting_order(posting_order)
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