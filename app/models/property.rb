class Property < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :view_applications, dependent: :destroy
end
