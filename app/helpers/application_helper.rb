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
end
