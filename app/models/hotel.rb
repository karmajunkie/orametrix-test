class Hotel < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :description

  validates :rate,
            :presence => true,
            :numericality => true

  validates_associated :city
  validates_presence_of :city

  belongs_to :city
  has_many :trips

  def self.cheap
    where("rate < 100")
  end

  def self.rated(stars = 3)
    where("star_rating >= ?", stars)
  end

  def self.dallas
    where("city_id = 1")
  end
end