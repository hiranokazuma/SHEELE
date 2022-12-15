class Reply < ApplicationRecord

  belongs_to :message
  belongs_to :user
  belongs_to :admin
  has_many :notifications, dependent: :destroy
end
