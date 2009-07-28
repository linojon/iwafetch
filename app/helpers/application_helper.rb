# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def news_service_name(service)
    NEWS_SERVICES.find {|k,v| v==service}.first
  end
end
