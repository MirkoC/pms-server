class PostingOrder < ActiveRecord::Base
  has_one :surface
  belongs_to :poster_worker
end
