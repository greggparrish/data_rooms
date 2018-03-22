class Documents::ApproveAsset
  include Service

  attr_accessor :current_user, :asset

  def initialize(current_user, asset)
    @user = current_user
    @asset = asset
  end

  def call
    #check if user admin, approve asset (1), which adds it to the project
    if ProjectPolicy.new(@user, @asset.project).update?
      @asset.approve = 1
      @asset.save
    end
    @asset
  end
end
