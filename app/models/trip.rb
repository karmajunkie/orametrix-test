class Trip < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  belongs_to :hotel
end
