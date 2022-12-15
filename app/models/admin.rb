class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :notifications
has_many :messages
has_many :replies
has_many :management_notices
has_many :active_notifications, class_name: 'Notification', foreign_key: 'admin_send_id', dependent: :destroy
has_many :passive_notifications, class_name: 'Notification', foreign_key: 'admin_receive_id', dependent: :destroy
end
