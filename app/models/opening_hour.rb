class OpeningHour < ActiveHash::Base
  self.data = [
    { id: 1, name: '-----' },
    { id: 2, name: '早朝' },
    { id: 3, name: '午前' },
    { id: 5, name: '正午' },
    { id: 6, name: '午後' },
    { id: 7, name: '夕方' },
    { id: 8, name: '夜' },
    { id: 9, name: '深夜' }
  ] 

  include ActiveHash::Associations
  has_many :posts

end