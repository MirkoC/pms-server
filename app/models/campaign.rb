class Campaign < ActiveRecord::Base
  has_many :rents
  has_many :surfaces, :through => :rents
  validate :possible_start_end_time


  def add_surfaces(surfaces)
    surfaces.each do |surface|
      Rent.new(rent_params(surface)).save
    end
  end

  private
  def rent_params(surface)
    {:rent_number => self[:name_of_campaign] + surface[:code].scan(/\d/).join(''), :rent_type => 'campaign',
     :start_time => self[:start_time], :end_time => self[:end_time], :campaign_id => self[:id], :surface_id => surface[:id]}
  end

  def possible_start_end_time
    if (start_time.utc >= end_time.utc)
      errors.add(:end_time, 'end_time can not be before start time')
    end
  end
end
