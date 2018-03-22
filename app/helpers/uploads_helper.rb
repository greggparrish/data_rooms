module UploadsHelper
  # DRY format carrierwave URLS
  def document_url(uploadfile)
    "/storage/document/doc_file/#{uploadfile.id}/#{File.basename(uploadfile.doc_file.to_s)}"
  end

  # Insert filetype icon
  def filetype_icon(file)
    if file == "application/excel"
      haml_tag :icon, :class => "fa fa-file-excel-o", :title => "Microsoft Excel"
    elsif file=="application/msword"
      haml_tag :icon, :class => "fa fa-file-word-o", :title => "Microsoft Word"
    elsif file == "application/pdf"
      haml_tag :icon, :class => "fa fa-file-pdf-o", :title => "PDF"
    elsif file == "application/text"
      haml_tag :icon, :class => "fa fa-file-text-o", :title => "Text"
    elsif file == "application/jpeg"
      haml_tag :icon, :class => "fa fa-picture", :title => "Text"
    end
  end
end


