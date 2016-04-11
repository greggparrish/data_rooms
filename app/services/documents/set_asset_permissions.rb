class Documents::SetAssetPermissions
  include Service

  attr_accessor :current_user, :document

  def initialize(current_user, document)
    @user = current_user
    @document = document
  end

  def call
    #check if user is proj admin, if so approve asset immediately, if not, keep asset as pending (0) and add username of person suggesting asset
    @document.assets.each do |a|
      if ProjectPolicy.new(@user,a.project).update?
        a.approved = 1
        a.save
      else
        a.suggested_by = @user
        a.save
      end
    end
  end
end


