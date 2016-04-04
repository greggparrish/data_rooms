module DocumentsHelper
  # Format title, new if exists, orig if not
  def doc_title(d) 
    if d.title.empty? 
      d.original_filename.gsub(/_/, ' ').upcase
    else
      d.title.upcase
    end
  end

  def doc_meta(d)
    uploader = d.user == current_user ? '' : 'by '+d.user.upcase+', '
    #fname = d.title.present? ? ' '+truncate(d.original_filename, length: 30) : ''
    "#{uploader}#{d.created_at.strftime("%b %d, %Y")}, (#{number_to_human_size(d.file_size)})"
  end



end

