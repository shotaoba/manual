class Tag < ApplicationRecord
  has_many :work_manual_tag_relations, dependent: :destroy
  has_many :work_manuals, through: :work_manual_tag_relations
  validates :name, uniqueness: true



end
