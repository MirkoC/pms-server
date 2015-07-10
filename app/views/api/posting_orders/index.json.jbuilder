json.array!(@posting_orders) do |posting_order|
  json.partial! 'api/posting_orders/posting_order', posting_order: posting_order
end
