module ApplicationHelper
  # return full title
  def full_title(page_title = '') 
    base_title = "AMPHORAE"
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
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''
    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end
end
