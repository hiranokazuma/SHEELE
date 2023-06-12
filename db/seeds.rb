# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@admin',
  password: 'administrator'
  )
#　管理者ログインページ
# https://sheele.site/admin/sign_in

users = User.create!(
  [
    {company_name: "星野不動産㈱", location: "東京都千代田区有楽町０―０―０", licensing_entity: "国土交通大臣", licensing_region: , update_number: "1", license_number: "99999",
    representatives_name: "星野太郎",telephone_number: "0123456789", manager_name: "星野次郎", email: 'hoshino-re@test.com', password: 'password' },
    {company_name: "㈱トワイライトエステート", location: "東京都渋谷区代々木０―０―０", licensing_entity: "知事", licensing_region: "東京都", update_number: "5", license_number: "999999",
    representatives_name: "黄昏太郎",telephone_number: "1234567890", manager_name: "黄昏次郎", email: 'twilight-re@test.com', password: 'password'},
    {company_name: "天の川不動産㈱", location: "東京都港区南青山０―０―０", licensing_entity: "知事", licensing_region: "東京都", update_number: "10", license_number: "888888",
    representatives_name: "天川太郎",telephone_number: "0987654321", manager_name: "天川次郎", email: 'milkyway-re@test.com', password: 'password'}
  ]
)
Property.create!(
  [
    {user_id: users[0].id, kind: "土地", right: "所有権", prefecture: "東京都", municipality: "港区", city_block: "南青山０丁目", address: "１－１", line: "半蔵門線", station: "表参道駅",
    walking_minute: 6, land_area: 123.45, price: 29800, sell_category: "相続", building_coverage_ratio: 100 , floor_area_ratio: 500, city_planning: "市街化区域", use_area: "商業地域",
    legal_restriction: "防火地域", road_contact: "北西側公道約25m", condition: "上物あり", comment: "相続案件のため、売主は早期売却希望です。ご連絡はEメールにてお願いいたします。",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-property1.jpg"), filename:"sample-property1.jpg") },
    {shop_name: '和食屋せん', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), caption: '日本料理は美しい！', user_id: users[1].id },
    {shop_name: 'ShoreditchBar', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), caption: 'メキシコ料理好きな方にオススメ！', user_id: users[2].id }
  ]
)