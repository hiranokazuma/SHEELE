class Message < ApplicationRecord

  has_many :replies, dependent: :destroy
  belongs_to :user # メッセージ作成者 = current_user
  has_many :notifications, dependent: :destroy


end
