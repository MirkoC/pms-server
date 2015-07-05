class SurfaceType < ActiveRecord::Base
  has_many :surfaces

  validate :possible_types
  validates :name, uniqueness: true

  private
  def possible_types
    if not (name == 'billboard' || name == 'city light')
      errors.add(:name, 'unknown name of type')
    end
  end
end
