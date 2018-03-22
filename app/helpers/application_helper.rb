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
      render(partial: 'shared/sb_user_module') + render(partial: 'shared/sb_notifications_module')
    elsif c == 'projects' && a == 'show'
      render(partial: 'shared/sb_project_module') + render(partial: 'shared/sb_stakeholders_module')
    elsif c == 'documents' && a == 'show'
      render(partial: 'shared/sb_document_module') + render(partial: 'shared/sb_notifications_module')
    elsif c == 'teams' && a == 'show'
      render(partial: 'shared/sb_team_module') + render(partial: 'shared/sb_members_module')
    end
  end

  # Add star next to admins in membership boxes
  def admin_icon(association)
    if association.abilities <= 2
      haml_tag :i, class: "fa fa-star text-warning"
    end
  end

end
