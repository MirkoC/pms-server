class Campaign < ActiveRecord::Base
  has_many :rents
  has_many :surfaces, :through => :rents
  validate :possible_start_end_time


  def add_surfaces(surfaces)
    surfaces.each do |surface|
      Rent.new(rent_params(surface)).save
      #surface.update(campaign_id: self[:id])
    end
  end

  private
  def rent_params(surface)
    {:rent_number => self[:name_of_campaign] + surface[:surface_number].scan(/\d/).join(''), :rent_type => 'campaign',
     :start_time => self[:start_time], :end_time => self[:end_time], :campaign_id => self[:id], :surface_id => surface[:id]}
  end
  def possible_start_end_time
    if (start_time.utc >= end_time.utc)
      errors.add(:end_time, 'end_time can not be before start time')
    end
    if (end_time.utc < Time.now)
      errors.add(:end_time, 'end_time can not be before today')
    end
    if (start_time.utc < Time.now)
      errors.add(:start_time, 'start_time can not be before today')
    end
  end
end
