


describe PosterWorker do

  before(:each) do
    time = Time.now
    posting_order_hash = {:name => 'First posting order for Ivanić surface', :surface => nil, :location => nil,
                          :issue_date => time, :state => 'not yet issued', :id => nil}
    @posting_order = PostingOrder.new(posting_order_hash)
    poster_worker_hash = {:name => 'Mirko Cerovac', :street_address => 'Selska 23', :city => 'Zagreb',
                          :state => 'Grad Zagreb', :country => 'Hrvatska', :postal_code => '10000',
                          :email => 'mirko@fp.com', :phone => '555-6555', :posting_orders=> nil, :id => nil}
    @poster_worker = PosterWorker.new(poster_worker_hash)
  end

  describe '#assign_posting_order' do
    it 'assigns posting order to the worker' do
      @poster_worker.assign_posting_order(@posting_order)
      expect(@poster_worker.posting_orders).to eq([@posting_order])
    end
  end

  describe '#remove_posting_order' do
    it 'removes posting order for the worker from his posting orders array' do
      @poster_worker.assign_posting_order(@posting_order)
      @poster_worker.remove_posting_order(@posting_order)
      expect(@poster_worker.posting_orders).to eq([])
    end
  end

end