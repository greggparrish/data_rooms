# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string(255)
#  title                  :string(255)
#  company                :string(255)
#  avatar                 :string(255)
#  avatar_updated_at      :datetime
#  name                   :string(255)
#  slug                   :string(255)
#

class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :send_welcome_email, only: [:create]

  def show
    @user = User.friendly.find(params[:id])
  end

  private
  def send_welcome_email
    Mailer.welcome_email(@user).deliver_now
  end
end
