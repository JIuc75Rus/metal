module ApplicationHelper
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

  def build_breadcrumb(category)
    result = []
    category.ancestors.each do |sub|
      result << content_tag(:li, class: 'menu_sub') do
        link_to(sub.name, sub)
      end
    end
    result << content_tag(:li, category.name, class: 'menu_sub')
    result.join('').html_safe
  end
end
