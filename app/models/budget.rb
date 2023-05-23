class Budget < ActiveHash::Base
  self.data = [
    { id: 1, name: '〜1,000' },
    { id: 2, name: '〜3,000' },
    { id: 3, name: '〜5,000' },
    { id: 4, name: '〜10,000' },
    { id: 5, name: '〜15,000' },
    { id: 6, name: '〜20,000' },
    { id: 7, name: '20,001〜' }
  ] 

  include ActiveHash::Associations
  has_many :posts

end