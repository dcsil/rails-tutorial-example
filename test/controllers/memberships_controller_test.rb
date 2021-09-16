require "test_helper"

class MembershipsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @membership = memberships(:one)
    @user = @membership.user
    @channel = @membership.channel
    sign_in(@user)
  end

  test "destroy discards the membership" do
    assert_no_difference("Membership.count") do
      assert_difference('Membership.kept.count', -1) do
        delete channel_membership_url(@channel, @membership)
      end
      assert_redirected_to channels_url
      follow_redirect!
    end
  end

  test "destroy redirects to sign in with not logged in" do
    sign_out(@user)

    assert_no_difference("Membership.count") do
      assert_no_difference('Membership.kept.count') do
        delete channel_membership_url(@channel, @membership)
      end
      assert_redirected_to new_user_session_path
    end
  end
end
