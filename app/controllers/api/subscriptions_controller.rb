# frozen_string_literal: true

class Api::SubscriptionsController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def receive
    subscription_name = params[:subscription].split("/").last
    subscriptionInstance = subscription_name.constantize
    subscriptionInstance.new.process(params)
    render json: { message: 'received' }, status: :ok
  end
end
