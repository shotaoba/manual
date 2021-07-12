class WorkManual < ApplicationRecord
  has_one_attached :video
  belongs_to :user
  has_many :procedures, dependent: :destroy
  has_many :work_manual_tag_relations, dependent: :destroy
  has_many :tags, through: :work_manual_tag_relations
  
  with_options presence: true do
    validates :title
    validates :process
  end

end
