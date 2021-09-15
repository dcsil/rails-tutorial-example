json.extract! message, :id, :content, :sender_id, :recipient_id, :recipient_type, :created_at, :updated_at
json.url channel_message_url(message.recipient, message, format: :json)
json.content message.content.to_s