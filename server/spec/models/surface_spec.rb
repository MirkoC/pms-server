require 'spec_helper'
require 'models'
require 'byebug'

describe Surface do

  before(:each) do
    surface_hash = {:location => nil, :price => '100kn', :height => '4', :line => '2'}
    @surface = Surface.new(surface_hash)
  end

  describe '#new_posting_order' do
    it 'adds posting order to the array of posting orders in Surface model' do
      Struct.new('PostingOrder', :name, :finish_until)
      new_posting_order = Struct::PostingOrder.new('New billboard on Ivanić street', Time.now)
      @surface.new_posting_order(new_posting_order)
      expect(@surface.posting_orders).to eq([new_posting_order])
      expect(@surface.active_posting_order).to eq(new_posting_order)
    end
  end

  describe '#cancel_posting_order' do
    it 'cancels active posting order and sets active posting order to none (but it stays in the array)' do
      Struct.new('PostingOrder', :name, :finish_until)
      new_posting_order = Struct::PostingOrder.new('New billboard on Ivanić street', Time.now)
      @surface.new_posting_order(new_posting_order)
      @surface.cancel_posting_order
      expect(@surface.active_posting_order).to eq(nil)
    end
  end

  describe '#delete_posting_order' do
    it 'deletes posting order and sets active to nill if deleted posting order was active' do
      Struct.new('PostingOrder', :name, :finish_until)
      new_posting_order = Struct::PostingOrder.new('New billboard on Ivanić street', Time.now)
      @surface.new_posting_order(new_posting_order)
      @surface.delete_posting_order(new_posting_order)
      @surface.posting_orders.map do |po|
        expect(po).not_to eq(new_posting_order)
      end
      expect(@surface.active_posting_order).to eq(nil)
    end
  end

end