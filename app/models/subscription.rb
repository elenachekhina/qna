class Subscription < ApplicationRecord
  belongs_to :subscriptable, polymorphic: true
  belongs_to :subscriber, class_name: 'User'

end
