class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '食事' },
    { id: 2, name: 'カフェ・軽食' },
    { id: 3, name: 'バー・ナイトスポット' },
    { id: 4, name: 'アクティビティ・体験施設' },
    { id: 5, name: 'ショッピング' },
    { id: 6, name: '自然・景色' },
    { id: 7, name: '歴史・建造物' },
    { id: 8, name: 'ホテル・宿' },
    { id: 9, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
end
