class DoctreesController < InheritedResources::Base

  private

    def doctree_params
      params.require(:doctree).permit(:document_id, :folder_id)
    end
end

