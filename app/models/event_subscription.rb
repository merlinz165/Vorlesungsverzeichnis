class EventSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  serialize :data, ActiveRecord::Coders::Hstore

  scope :active, lambda { where(deleted_at: nil) }
end
