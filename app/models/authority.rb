class  Authority< ActiveHash::Base
  self.data = [
    {id: 1, name: '--'},
    {id: 2, name: '閲覧のみ'},
    {id: 3, name: '作成修正権限'},
    {id: 4, name: '承認権限'}
  ]

  include ActiveHash::Associations
  has_many :users
end