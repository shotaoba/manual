class Procedure < ApplicationRecord
  belongs_to :work_manual
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :description
    validates :image
  end
end
