class Location < ActiveRecord::Base
  has_many :surfaces, dependent: :destroy
end
