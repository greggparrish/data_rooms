module ApplicationHelper
  # return full title
  def full_title(page_title = '') 
    base_title = "DATA ROOMS"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  # page titles in header
  def page_title(page_title = '')
    if page_title.empty?
      ''
    else
      haml_tag :h3, page_title
    end
  end

  # nav links with current page highlight
  def nav_link(link_text, link_icon, link_path)
    class_name = 'active' if request.url.include?(link_path)
    content_tag(:li, :class => class_name) do
      link_to link_path do
        haml_tag :i, class: "fa fa-#{link_icon}"
        haml_tag :span, link_text, class: 'navtext'
      end
    end
  end
end
