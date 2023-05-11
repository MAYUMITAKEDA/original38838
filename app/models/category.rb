class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '-----' },
    { id: 2, name: '食事' },
    { id: 3, name: 'カフェ・軽食' },
    { id: 5, name: 'バー・ナイトスポット' },
    { id: 6, name: 'アクティビティ・体験施設' },
    { id: 7, name: 'ショッピング' },
    { id: 8, name: '自然・景色' },
    { id: 9, name: '歴史・建造物' },
    { id: 10, name: 'ホテル・宿' },
    { id: 11, name: 'その他' }
  ] 

  include ActiveHash::Associations
  has_many :posts

end