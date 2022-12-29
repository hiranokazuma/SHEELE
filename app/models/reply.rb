class Reply < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true

  belongs_to :message
  belongs_to :user
  belongs_to :admin
  has_many :notifications, dependent: :destroy

  def create_notification_admin(current_admin, visited_id)
    # すでに「送信」されているか検索
      temp = Notification.where(["admin_send_id = ? and visited_id = ? and reply_id = ? and notice_type = ? ", current_admin.id, visited_id, id, 'reply'])
      # temp = Notification.where(["visitor_id = ? and visited_id = ? and notice_type = ? ", current_user.id, user_id, 'apply'])
    # 送信されていない場合のみ、通知レコードを作成
    if temp.blank?
      # notification = current_admin.active_notifications.new(
      notification = Notification.new(
        reply_id: id,
        visited_id: visited_id,
        notice_type: 'reply',
        admin_send_id: current_admin.id
      )
    # 自分の物件に対する申請の場合は、通知済みとする
      # if notification.visitor_id == notification.visited_id
      #   notification.read = true
      # end
      notification.save! #if notification.valid?
    end
  end

end
