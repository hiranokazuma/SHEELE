class Message < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true
  validates :admin_id, presence: true

  has_many :replies, dependent: :destroy
  belongs_to :user # メッセージ作成者 = current_user
  has_many :notifications, dependent: :destroy

  def create_notification_user(current_user, admin_receive_id)
    # すでに「送信」されているか検索
      temp = Notification.where(["visitor_id = ? and admin_receive_id = ? and message_id = ? and notice_type = ? ", current_user.id, admin_receive_id, id, 'message'])
      # temp = Notification.where(["visitor_id = ? and visited_id = ? and notice_type = ? ", current_user.id, user_id, 'apply'])
    # 送信されていない場合のみ、通知レコードを作成
    if temp.blank?
      # notification = current_admin.active_notifications.new(
      notification = Notification.new(
        message_id: id,
        visitor_id: current_user.id,
        notice_type: 'message',
        admin_receive_id: admin_id
      )
    # 自分の物件に対する申請の場合は、通知済みとする
      # if notification.visitor_id == notification.visited_id
      #   notification.read = true
      # end
      notification.save if notification.valid?

    end
  end
end
