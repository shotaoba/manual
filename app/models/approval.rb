class Approval < ApplicationRecord
  belongs_to :user
  belongs_to :work_manual
end
