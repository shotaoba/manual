class WorkManualTagRelation < ApplicationRecord
  belongs_to :work_manual
  belongs_to :tag
end
