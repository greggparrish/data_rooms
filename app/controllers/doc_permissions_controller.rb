class DocPermissionsController < InheritedResources::Base

  private
    def doc_permission_params
      params.require(:doc_permission).permit()
    end
end

