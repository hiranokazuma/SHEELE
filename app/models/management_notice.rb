class ManagementNotice < ApplicationRecord

  has_many :notifications

  validates :title, presence: true
  validates :content, presence: true

  def create_notification_admin(current_admin, user_id)
    # すでに「送信」されているか検索
      # temp = Notification.where(["admin_send_id = ? and management_notice_id = ? and notice_type = ? ", current_admin.id, id, 'management_notice'])
      temp = Notification.where(["admin_send_id = ? and visited_id = ? and management_notice_id = ? and notice_type = ? ", current_admin.id, user_id, id, 'management_notice'])

    # 送信されていない場合のみ、通知レコードを作成
    if temp.blank?
      # notification = current_admin.active_notifications.new(
      notification = Notification.new(
        management_notice_id: id,
        notice_type: 'management_notice',
        admin_send_id: current_admin.id,
        visited_id: user_id
      )
    # 自分の物件に対する申請の場合は、通知済みとする
      # if notification.visitor_id == notification.visited_id
      #   notification.read = true
      # end
      notification.save! #if notification.valid?
    end
  end
end
