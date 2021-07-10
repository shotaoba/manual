class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :authority_id, numericality: { other_than: 1 } 

  end

  has_many :work_manuals
  has_many :approvals
  has_many :procedures

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :authority

end
