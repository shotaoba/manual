class WorkManual < ApplicationRecord
  has_one_attached :video
  belongs_to :user
  has_many :procedures
  
  with_options presence: true do
    validates :title
    validates :process
  end
end
