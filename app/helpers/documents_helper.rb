module DocumentsHelper
  # Format title, new if exists, orig if not
  def doc_title(d) 
    if d.title.empty? 
      link_to d.original_filename.upcase, document_path(d), class: 'listtitle'
    else
      link_to d.title.upcase, document_path(d), class: 'listtitle'
    end
  end

  def doc_meta(d)
    uploader = d.user == current_user ? 'you' : d.user
    "Uploaded by #{uploader} on #{d.created_at.strftime("%b %d, %Y")}"
  end

end

