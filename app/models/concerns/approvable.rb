# == Approvable concern
#
# Filter assets to approved or pending (the latter suggested by a non-admin user for inclusion in a project). Default approved
#
module Approvable
  extend ActiveSupport::Concern
  included do
    # By default all models should be ordered
    # showing only those already approved
    default_scope { approved }
    scope :approved, -> { where(approved: true) }
    scope :pending, -> { where(approved: false) }
  end
end
