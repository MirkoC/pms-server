class Surface < ActiveRecord::Base
  has_many :posting_orders
  has_many :rents
  belongs_to :location
  has_many :campaigns, :through => :rents
  belongs_to :surface_type


  #surfaces?timespan='int sth'&used_at_least='int sth'
  def self.most_popular(timespan, used)
    Surface.select('surfaces.*, count(*) as count').joins(:rents).where('rents.start_time > ?', timespan.month.ago)
        .group(:id).having('count(*) >= ?', used).order(count: :desc)
  end

  def used

  end

  has_attached_file :image, :styles => { :medium => '300x300>', :thumb => '100x100>' }, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
