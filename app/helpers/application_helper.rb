module ApplicationHelper
  require 'rubygems'
  require 'geoip'
  def urls_to_images(s)
    s.gsub! /\s|(http:\/\/.*?\.(png|jpg|jpeg))(\s|\Z)/,
            '<img src="\1"/ id="something_unique" class="thumb">'
    s.html_safe
  end

  def urls_to_links(s)
    s.gsub! /\s|(http:\/\/.*?\.(png|jpg))(\s|\Z)/,
            '<a href="\1"/>\1</a>'
    s.html_safe
  end
  def geo
     @geoip ||= GeoIP.new("#{Rails.root}/db/GeoLiteCity.dat")
     remote_ip = request.remote_ip
     if remote_ip != "127.0.0.1" #todo: check for other local addresses or set default value
       location_location = @geoip.country(remote_ip)
       if location_location != nil
         @model.country = location_location[2]
       end
     end
  end
end
