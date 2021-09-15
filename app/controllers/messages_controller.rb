class MessagesController < ApplicationController
  before_action :set_channel
  before_action :set_message, only: %i[ show edit update destroy ]

  # POST /messages or /messages.json
  def create
    @message = @channel.messages.build(message_params)
    @message.sender = current_user
    @message.recipient = @channel

    if @message.save
      render :show, status: :created, location: [@channel, @message], formats: :json
    else
      render json: @message.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    if @message.update(message_params)
      render :show, status: :ok, location: [@channel, @message], formats: :json
    else
      render json: @message.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy
    head :no_content
  end

  private
    def set_channel
      @channel = Channel.find(params[:channel_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = @channel.messages.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:content)
    end
end
