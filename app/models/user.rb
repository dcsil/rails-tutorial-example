class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memberships, dependent: :destroy
  has_many :channels, through: :memberships, dependent: :nullify
  has_many :active_memberships, -> { kept }, class_name: "Membership"
  has_many :active_channels, through: :active_memberships, source: :channel
  has_many :created_channels, class_name: "Channel", foreign_key: :user_id
  has_many :messages, as: :recipient
  has_many :sent_messages, as: :sender, class_name: "Message"
end
