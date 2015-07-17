class PosterWorker < ActiveRecord::Base
  has_many :posting_orders
end
