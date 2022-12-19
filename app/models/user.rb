class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :company_name, presence: true
  validates :location, presence: true
  validates :licensing_entity, presence: true
  validates :update_number, presence: true
  validates :license_number, presence: true
  validates :representatives_name, presence: true
  validates :telephone_number, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_many :notifications, dependent: :destroy
  has_many :properties, dependent: :destroy
  has_many :view_applications, dependent: :destroy
  has_many :view_application_properties, through: :view_applications, source: :property
  has_many :messages, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  
  def create_view_application(property)
    view_application = self.view_applications.find_or_create_by(property_id: property.id)
  end
  
  def destroy_view_application(property)
    view_application = self.view_applications.find_by(property_id: property.id)
    if view_application && view_application.apply_status != "申請中"
      errors.add(:base, "ステータスが申請中以外です。")
    elsif view_application
      view_application.destroy
    end
  end
end
