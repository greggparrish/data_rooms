class MembershipsController < InheritedResources::Base

  private

    def membership_params
      params.require(:membership).permit(:user_id, :team_id)
    end
end

