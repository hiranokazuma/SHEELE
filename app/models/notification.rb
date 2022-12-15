class Notification < ApplicationRecord

  belongs_to :user
  belongs_to :admin

default_scope -> { order(created_at: :desc) }
  belongs_to :view_application, optional: true
  belongs_to :property, optional: true
  belongs_to :message, optional: true
  belongs_to :reply, optional: true
  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
