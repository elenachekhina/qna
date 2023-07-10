class SubscriptionService

  def send_update_with(object)
    object.question.subscribers.find_each(batch_size: 500) do |user|
      QuestionUpdateMailer.send_updates(user, object).deliver_later
    end
  end

end