require 'spec_helper'
require 'models'
require 'byebug'

describe Surface do

  before(:each) do
    time = Time.now
    surface_hash = {:location => nil, :price => '100kn', :height => '4', :line => '2', :posting_orders => nil, :id => nil}
    @surface = Surface.new(surface_hash)
    posting_order_hash = {:name => 'First posting order for Ivanić surface', :surface => nil, :location => nil,
                          :issue_date => time, :state => 'not yet issued', :id => nil}
    @posting_order = PostingOrder.new(posting_order_hash)
  end

  describe '#new_posting_order' do
    it 'adds posting order to the array of posting orders in Surface model' do
      @surface.issue_posting_order(@posting_order)
      expect(@posting_order.surface).to eq(@surface)
      expect(@posting_order.location).to eq(@surface.location)
      expect(@surface.posting_orders).to eq([@posting_order])
      expect(@surface.active_posting_order).to eq(@posting_order)
    end
  end

  describe '#cancel_posting_order' do
    it 'cancels active posting order and sets active posting order to none (but it stays in the array)' do
      @surface.issue_posting_order(@posting_order)
      @surface.cancel_posting_order
      expect(@surface.active_posting_order).to eq(nil)
    end
  end

  describe '#delete_posting_order' do
    it 'deletes posting order and sets active to nill if deleted posting order was active' do
      @surface.issue_posting_order(@posting_order)
      @surface.delete_posting_order(@posting_order)
      @surface.posting_orders.map do |po|
        expect(po).not_to eq(@posting_order)
      end
      expect(@surface.active_posting_order).to eq(nil)
    end
  end

end