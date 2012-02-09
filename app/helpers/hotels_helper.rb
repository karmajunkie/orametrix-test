module HotelsHelper
  def display_title(hotel)
    content = "#{hotel.name} ("
    1.upto hotel.star_rating.to_i do
      content += "*"
    end
    content += ")"
    content
  end
end
