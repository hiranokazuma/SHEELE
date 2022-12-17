class Property < ApplicationRecord
  has_one_attached :image

  validates :kind, presence: true
  validates :right, presence: true
  validates :prefecture, presence: true
  validates :municipality, presence: true
  validates :city_block, presence: true
  validates :address, presence: true
  validates :line, presence: true
  validates :station, presence: true
  validates :walking_minute, presence: true
  validates :land_area, presence: true
  validates :building_area, presence: true
  validates :price, presence: true
  validates :sell_category, presence: true
  validates :age, presence: true
  validates :structure, presence: true
  validates :building_coverage_ratio, presence: true
  validates :floor_area_ratio, presence: true
  validates :condition, presence: true
  validates :release_status, inclusion: { in: [true, false] }


  belongs_to :user
  has_many :view_applications, dependent: :destroy
  has_many :notifications, dependent: :destroy

  enum kind: { 土地: 0, 戸建て: 1, 区分マンション: 2, 一棟ビル: 3, 一棟マンション: 4, その他: 5 }
  enum right: { 所有権: 0, 借地権: 1, 底地権: 2 }

  enum prefecture:{
     "----":0,
     北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
     茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
     新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
     岐阜県:21,静岡県:22,愛知県:23,三重県:24,
     滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
     鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
     徳島県:36,香川県:37,愛媛県:38,高知県:39,
     福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
     沖縄県:47
   }
  enum sell_category: { 相続: 0, 財産分与: 1, 債務整理: 2, その他早期売却: 3 }
  enum condition: { 更地: 0, 空室: 1, 居住中: 2, 賃貸中: 3, 上物あり: 4 }
end
