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

  # Fill in boxes in left sidebar based on page
  def sidebar_modules(c,a)
    if a == 'index'
      render(partial: 'shared/user_box') + render(partial: 'shared/notifications_box')
    elsif c == 'projects' && a == 'show'
      render(partial: 'shared/project_box') + render(partial: 'shared/members_box')
    elsif c == 'documents' && a == 'show'
      render(partial: 'shared/document_box') + render(partial: 'shared/notifications_box')
    elsif c == 'teams' && a == 'show'
      render(partial: 'shared/team_box') + render(partial: 'shared/members_box')
    end
  end

end
