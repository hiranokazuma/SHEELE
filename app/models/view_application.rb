class ViewApplication < ApplicationRecord

  validates :user_id, presence: true
  validates :property_id, presence: true
  validates :apply_status, presence: true

  belongs_to :user
  belongs_to :property
  has_many :notifications, dependent: :destroy

  enum apply_status:{ 申請中: 1, 許可: 2, 否認: 3 }

  def create_notification_user(current_user, property)
    # すでに「申請」されているか検索
      temp = Notification.where(["visitor_id = ? and visited_id = ? and view_application_id = ? and notice_type = ? ", current_user.id, property.user_id, id, 'apply'])
      # temp = Notification.where(["visitor_id = ? and visited_id = ? and notice_type = ? ", current_user.id, user_id, 'apply'])
    # 申請されていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        property_id: property.id,
        view_application_id: id,
        visited_id: property.user_id,
        notice_type: 'apply'
      )
    # 自分の物件に対する申請の場合は、通知済みとする
      # if notification.visitor_id == notification.visited_id
      #   notification.read = true
      # end
      notification.save if notification.valid?
    end
  end
end