class Surface < ActiveRecord::Base
  has_many :rents
  belongs_to :location
  has_many :campaigns, :through => :rents
  has_one :surface_types

  def self.most_popular(timespan, used)
    Surface.select('surfaces.*, count(*) as count').joins(:rents).where('rents.start_time > ?', timespan.month.ago)
        .group(:id).having('count(*) > ?', used)
  end

  def used

  end

  has_attached_file :image, :styles => { :medium => '300x300>', :thumb => '100x100>' }, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
