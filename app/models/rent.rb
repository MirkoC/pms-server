class Rent < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :surface
end
