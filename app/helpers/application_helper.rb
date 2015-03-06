module ApplicationHelper
  def friendly_date(date) 
    date.strftime("%B %d, %Y")   
  end
end
