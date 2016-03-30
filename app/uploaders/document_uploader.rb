# encoding: utf-8
class DocumentUploader < CarrierWave::Uploader::Base
  before :cache, :save_original_filename
  include ActiveSupport::Inflector
  storage :file

  def store_dir
    "#{Rails.root}/storage/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    "#{Rails.root}/storage/cache/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(doc docx pdf odf)
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  def save_original_filename(file)
    model.original_filename ||= file.original_filename if file.respond_to?(:original_filename)
    model.original_filename = transliterate(model.original_filename).gsub(/[^\w\.\-]/, '_')
  end

  protected
  def secure_token(length=16)
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(22))
  end
end
