class FoldersController < InheritedResources::Base

  private
    def folder_params
      params.require(:folder).permit(:title, :slug)
    end
end

