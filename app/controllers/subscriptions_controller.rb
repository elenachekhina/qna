class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @subscription = Subscription.new(subscription_params)
    authorize @question

    @subscription.save
  end

  def destroy

  end

  private

  def load_subscription

  end

  def subscription_params
    @subscriber = User
    params.require(:subscription).permit(:subscriber, :subscriptable)
  end
end
