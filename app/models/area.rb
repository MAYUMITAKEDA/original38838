class Area < ActiveHash::Base
  self.data = [
    { id: 1, name: '日本' },
    { id: 2, name: 'アジア' },
    { id: 3, name: 'オセアニア・南太平洋' },
    { id: 4, name: 'カリブ・中南米' },
    { id: 5, name: 'ハワイ・グアム・サイパン' },
    { id: 6, name: 'ヨーロッパ' },
    { id: 7, name: '中近東・アフリカ' },
    { id: 8, name: '北米' }
  ] 

  include ActiveHash::Associations
  has_many :posts

end