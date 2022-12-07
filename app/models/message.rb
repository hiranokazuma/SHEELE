class Message < ApplicationRecord

  belongs_to :user
  belongs_to :admin

  enum kind: { 全体へのお知らせ: 0, 管理者メッセージ: 1, 会員メッセージ: 2 }

end
