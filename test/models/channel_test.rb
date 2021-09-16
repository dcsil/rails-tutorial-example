require "test_helper"

class ChannelTest < ActiveSupport::TestCase
  setup do
    @channel = channels(:one)
  end

  test "should return true if the channel has the given member" do
    member = @channel.members.first
    refute_nil member
    assert @channel.member?(member)
  end

  test "should return false if the channel does not have the given member" do
    member = User.where.not(id: @channel.members.pluck(:id)).first
    refute_nil member
    refute @channel.member?(member)
  end
end
