require 'spec_helper'
require 'models'

class PosterWorker

  def initialize(poster_worker_hash)
    @name, @street_address, @city, @state, @country, @postal_code, @email, @phone, @posting_orders, @id =
        poster_worker_hash.values_at(:name, :street_address, :city, :state, :country, :postal_code, :email, :phone,
                                     :posting_orders, :id)
    if (poster_worker_hash[:posting_orders] == nil)
      @posting_orders ||= []
    end
  end

  attr_reader :name, :street_address, :city, :state, :country, :postal_code, :email, :phone, :posting_orders, :id

  def assign_posting_order(posting_order)
    @posting_orders.push(posting_order)
  end

  def remove_posting_order(posting_order)
    @posting_orders.delete(posting_order)
  end

end