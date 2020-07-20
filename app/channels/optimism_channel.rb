class OptimismChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_account
  end
end
