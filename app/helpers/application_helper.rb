module ApplicationHelper
  def formatted_current_date
    formatted_date(Time.zone.now)
  end
  def formatted_date(date)
    date.strftime("%m/%d/%Y")
  end
end
