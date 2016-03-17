# == Schema Information
#
# Table name: documents
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  doc_file          :string(255)
#  file_content_type :string(255)
#  file_size         :integer
#  file_updated_at   :datetime
#  description       :text(65535)
#  user_id           :integer
#  title             :string(255)
#  original_filename :string(255)
#

class DocumentsController < ApplicationController  
  before_action :authenticate_user!
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :set_ownership, only: [:create]

  def index
    @documents = current_user.documents
  end

  def show
  end

  def new
    @document = @user.documents.new
    @projects = @user.projects
  end

  def create
    @document = @user.documents.build(document_params)
    @projects = @user.projects
    @document.user_id = @user.id
    respond_to do |f|
      if @document.save
        @permissions.document_id = @document.id
        @permissions.save
        f.html { redirect_to params[:document][:pid] != 'false' ? project_path(params[:document][:pid]) : @document, notice: 'Document added.' }
        f.json { render action: 'show', status: :created, location: @document }
      else
        f.html { render action: 'new' }
        f.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @projects = current_user.projects
  end

  def update
    if @document.update(document_params)
      redirect_to documents_path
    else
      render :edit
    end
  end

  def destroy
    @document.destroy
    redirect_to :back
  end

  def download
    @doc = Document.find(params[:id])
    send_file "#{@doc.doc_file.path}", disposition: 'attachment', x_sendfile: true
  end

  private
  def set_user
    @user = current_user
  end

  def set_document
    @document = Document.find(params[:id])
  end

  def set_ownership
    @permissions = DocPermission.new user_id: @user.id, abilities: 0, expires: Time.zone.parse('2099-01-01 21:00')
  end

  def document_params
    params.require(:document).permit(:doc_file, :title, :description, :user_id, :document_id, project_ids: [])
  end
end
