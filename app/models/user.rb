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
has_many :messages, dependent: :destroy

end
