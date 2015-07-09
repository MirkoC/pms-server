class Rent < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :surface


  def status
    if (self[:start_time].utc < Time.now and Time.now < self[:end_time].utc)
      'active'
    elsif (self[:start_time].utc > Time.now)
      'not yet started'
    elsif (self[:end_time].utc < Time.now)
      'finished'
    end
  end
end
