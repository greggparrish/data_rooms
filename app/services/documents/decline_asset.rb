class Documents::DeclineAsset
  include Service

  attr_accessor :current_user, :asset

  def initialize(current_user, asset)
    @user = current_user
    @asset = asset
  end

  def call
    #check if user admin, destroy asset
    if ProjectPolicy.new(@user, @asset.project).update?
      @asset.approved = 3
      @asset.save
    end
    @asset
  end
end

