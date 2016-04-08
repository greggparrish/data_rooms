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
  before_action :set_document, only: [:show, :edit, :update, :destroy, :permissions, :download]
  before_action :set_user
  after_action :verify_authorized, except: [:index, :new, :create]
  after_filter :verify_policy_scoped, :only => :index

  def index
    @documents = policy_scope(Document)
  end

  def show
    authorize @document
    if params[:project_id]
      @project = Project.friendly.find(params[:project_id])
    end
  end

  def new
    @document = @user.documents.new
    @projects = policy_scope(Project)
  end

  def create
    @document = @user.documents.build(document_params)
    @document.user_id = @user.id
    respond_to do |f|
      if @document.save
        @document.doc_permissions.create(user_id: @user.id, abilities: 0, expires: Time.zone.parse('2099-01-01 21:00'))
        f.html { redirect_to params[:document][:pid] != 'false' ? project_path(params[:document][:pid]) : @document, notice: 'Document added.' }
        f.json { render action: 'show', status: :created, location: @document }
      else
        f.html { render action: 'new' }
        f.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    authorize @document, :update?
  end

  def update
    if @document.update(document_params)
      redirect_to documents_path
    else
      render :edit
    end
  end

  def destroy
    authorize @document
    @document.destroy
    redirect_to :back
  end

  def download
    authorize @document
    send_file "#{@document.doc_file.path}", disposition: 'attachment', x_sendfile: true
  end

  private
  def set_user
    @user = current_user
  end

  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:doc_file, :title, :description, :user_id, :document_id, :abilities, :expiration, project_ids: [])
  end
end
