class MembershipsController < ApplicationController
  def destroy
    # Find the user's current_membership
    membership = current_user.memberships.find(params[:id])
    if membership.discard # Returns true if successful
      redirect_to channels_path, notice: "You have left the channel."
    else
      redirect_to channels_path, notice: "Failed to leave the channel: #{membership.errors.full_messages.to_sentence}"
    end
  end
end
