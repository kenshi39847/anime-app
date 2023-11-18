class Group < ActiveHash::Base
  self.data = [
    {id: 1, name: 'あ行'}, {id: 2, name: 'か行'}, 
    {id: 3, name: 'さ行'}, {id: 4, name: 'た行'}, {id: 5, name: 'な行'}, 
    {id: 6, name: 'は行'}, {id: 7, name: 'ま行'}, {id: 8, name: 'や行'}, 
    {id: 9, name: 'ら行'}, {id: 10, name: 'わ行'}
  ]
end