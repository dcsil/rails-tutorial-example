require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @message = messages(:one)
    @channel = @message.recipient
    sign_in(@message.sender)
  end

  test "should create message" do
    assert_difference('Message.count') do
      post channel_messages_url(@channel), params: { message: { content: "content" } }
    end

    message = Message.last
    assert_equal @channel, message.recipient
    assert_equal @message.sender, message.sender

    assert_response :created
  end

  test "should update message" do
    patch channel_message_url(@channel, @message), params: { message: { content: "more content" } }
    assert_response :success
  end

  test "should destroy message" do
    assert_difference('Message.count', -1) do
      delete channel_message_url(@channel, @message)
    end

    assert_response :success
  end
end
