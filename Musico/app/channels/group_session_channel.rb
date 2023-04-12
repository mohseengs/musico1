class GroupSessionChannel < ApplicationCable::Channel
  def subscribed
     stream_from "group_session_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
