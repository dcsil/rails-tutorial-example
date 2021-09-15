class Channel < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: :user_id

  has_many :memberships
  has_many :members, through: :memberships, source: :user

  validates :name, length: { maximum: 80 }, presence: true, uniqueness: true
  validates :description, length: { maximum: 240 }
end
