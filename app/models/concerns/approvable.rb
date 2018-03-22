# == Approvable concern
#
# Filter assets to approved or pending (the latter suggested by a non-admin user for inclusion in a project). Default approved
#
module Approvable
  extend ActiveSupport::Concern
  included do
    scope :approved, -> { where(approved: true) }
    scope :pending, -> { where(approved: false) }
  end
end
