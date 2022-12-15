class Message < ApplicationRecord

  has_many :replies, dependent: :destroy
  belongs_to :user # メッセージ作成者 = current_user
  has_many :notifications, dependent: :destroy
  # enum kind: { 全体へのお知らせ: 0, 管理者メッセージ: 1, 会員メッセージ: 2 }

end
