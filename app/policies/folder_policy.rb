class FolderPolicy
attr_reader :user, :folder
  def initialize(user, folder)
    @user = user
    @folder = folder
  end

  def update?
    @folder.stakeholders.exists?(['user_id = ? AND abilities <= ?', @user, "2" ])
  end
end
