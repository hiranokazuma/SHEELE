class Notification < ApplicationRecord

  belongs_to :user,optional: :true
  belongs_to :admin, optional: :true

default_scope -> { order(created_at: :desc) }
  belongs_to :view_application, optional: true
  belongs_to :property, optional: true
  belongs_to :message, optional: true
  belongs_to :reply, optional: true
  # belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  # belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
  # belongs_to :admin_send_id, class_name: 'Admin', foreign_key: 'admin_send_id', optional: true
  # belongs_to :admin_receive_id, class_name: 'Admin', foreign_key: 'admin_receive_id', optional: true
  enum notice_type: { apply: 0, message: 1, reply: 2, management_notice: 3}
end
