class ViewApplication < ApplicationRecord

  belongs_to :user
  belongs_to :property

  enum apply_status: { 未申請: 0, 申請中: 1, 許可: 2, 否認: 3 }
end
