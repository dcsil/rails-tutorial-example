class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :memberships
  has_many :channels, through: :memberships
  has_many :created_channels, class_name: "Channel", foreign_key: :user_id
end
