module DocumentsHelper

  # Format title, new if exists, orig if not
  def doc_title(d) 
    if d.title.empty? 
      d.original_filename.gsub(/_/, ' ').upcase
    else
      d.title.upcase
    end
  end

  # Add uploader (unless current_user), created date and size info
  def doc_meta(d)
    uploader = d.user == current_user ? '' : 'by '+d.user.upcase+', '
    "#{uploader}#{d.created_at.strftime("%b %d, %Y")}, (#{number_to_human_size(d.file_size)})"
  end

  # The next 3 populate documents toolbar based on permissions (view, dl, rm)
  def doc_toolbar_view(d)
    if policy(d).show?
      content_tag(:li, class: '') do
        link_to pdfjs.full_path(file: document_url(d)) do
          haml_tag :i, class: "fa fa-eye"
        end
      end
    end
  end
  def doc_toolbar_download(d)
    if policy(d).download?
      content_tag(:li, class: '') do
        link_to document_url(d) do
          haml_tag :i, class: "fa fa-download"
        end
      end
    end
  end
  def doc_toolbar_delete(d)
    if policy(d).destroy?
      content_tag(:li, class: '') do
        link_to document_path(d), :method => :delete, :data => { :confirm => 'Are you sure?' }, "data-original-title" => "Delete" do
          haml_tag :i, class: "fa fa-trash"
        end
      end
    end
  end



end
