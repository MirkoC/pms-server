class Campaign < ActiveRecord::Base
  has_many :surfaces
  validate :possible_start_end_time


  def add_surfaces(surfaces)
    surfaces.each do |surface|
      surface.update(campaign_id: self[:id])
    end
  end

  private
  def possible_start_end_time
    if (start_time.comparable_time >= end_time.comparable_time)
      errors.add(:end_time, 'end_time can not be before start time')
    end
    if (end_time.comparable_time < Time.now)
      errors.add(:end_time, 'end_time can not be before today')
    end
    if (start_time.comparable_time < Time.now)
      errors.add(:start_time, 'start_time can not be before today')
    end
  end
end
