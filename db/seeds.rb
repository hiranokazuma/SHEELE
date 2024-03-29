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
    {company_name: "星空不動産㈱", location: "東京都千代田区有楽町０―０―０", licensing_entity: "国土交通大臣", update_number: 1, license_number: 999999,
    representatives_name: "星空太郎",telephone_number: "0123456789", manager_name: "星空次郎", email: 'hoshizora-re@test.com', password: 'password' },
    {company_name: "㈱トワイライトエステート", location: "東京都渋谷区代々木０―０―０", licensing_entity: "知事", licensing_region: "東京都", update_number: 5, license_number: 9999999,
    representatives_name: "黄昏太郎",telephone_number: "1234567890", manager_name: "黄昏次郎", email: 'twilight-re@test.com', password: 'password'},
    {company_name: "天の川不動産㈱", location: "東京都港区南青山０―０―０", licensing_entity: "知事", licensing_region: "東京都", update_number: 10, license_number: 8888888,
    representatives_name: "天川太郎",telephone_number: "0987654321", manager_name: "天川次郎", email: 'milkyway-re@test.com', password: 'password'}
  ]
)
Property.create!(
  [
    {user_id: users[0].id, kind: "土地", right: "所有権", prefecture: "東京都", municipality: "港区", city_block: "白金０丁目", address: "１－１", line: "南北", station: "白金高輪",
    walking_minute: 10, land_area: 123.45, price: 29800, sell_category: "相続", building_coverage_ratio: 60 , floor_area_ratio: 300, city_planning: "市街化区域", use_area: "第一種中高層住居専用地域",
    legal_restriction: "準防火地域", road_contact: "北西側公道約25m", condition: "更地", comment: "＊テスト投稿＊ \n相続案件のため、売主は早期売却希望です。\nご連絡はEメールにてお願いいたします。",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_property1.jpg"), filename:"sample-property1.jpg") },
    {user_id: users[1].id, kind: "戸建て", right: "所有権", prefecture: "東京都", municipality: "渋谷区", city_block: "松濤０丁目", address: "１－１", line: "京王井の頭", station: "神泉",
    walking_minute: 5, land_area: 111.22, building_area: 150.15, floor_plan: "4LDK", price: 38000, age: "2007年12月", structure: "木造２階建", sell_category: "財産分与",
    building_coverage_ratio: 60 , floor_area_ratio: 150, city_planning: "市街化区域", use_area: "第一種低層住居専用地域", legal_restriction: "準防火地域、第一種高度地区",
    road_contact: "南東側公道約6.0m", condition: "居住中", comment: "＊テスト投稿＊ \n離婚による財産分与のため、売主は早期売却希望です。\nご連絡はEメールにてお願いいたします。",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_property2.jpg"), filename:"sample-property2.jpg") },
    {user_id: users[2].id, kind: "区分マンション", right: "所有権", building_name: "レシェール代官山", prefecture: "東京都", municipality: "渋谷区", city_block: "鴬谷町", address: "０－０", line: "東急東横", station: "代官山",
    walking_minute: 10, land_of_co_ownership: "12345/456789", building_area: 198.76, floor_plan: "5LDK", price: 39800, age: "2010年9月", structure: "鉄筋コンクリート造地上7階、地下1階", sell_category: "債務整理", location_floor: 5,
    building_coverage_ratio: 60 , floor_area_ratio: 200, city_planning: "市街化区域", use_area: "第一種低層住居専用地域", legal_restriction: "準防火地域、第二種高度地区",
    road_contact: "南東側公道約5.0m", condition: "居住中", comment: "＊テスト投稿＊ \n債務整理のため、売主は早期売却希望です。\nご質問はEメールにてお願いいたします。",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_property3.jpg"), filename:"sample-property3.jpg") }
  ]
)