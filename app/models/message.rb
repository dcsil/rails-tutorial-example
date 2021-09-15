class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, polymorphic: true
  has_rich_text :content
end
