class Channel < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: :user_id

  has_many :memberships
  has_many :members, through: :memberships, source: :user

  has_many :active_memberships, -> { kept }, class_name: "Membership"
  has_many :active_members, through: :active_memberships, source: :user

  validates :name, length: { maximum: 80 }, presence: true, uniqueness: true
  validates :description, length: { maximum: 240 }

  def member?(user)
    active_memberships.exists?(user_id: user.id)
  end
end
