class Genre < ActiveHash::Base
  self.data = [
    {id: 1, name: 'アクション'}, {id: 2, name: 'アドベンチャー'}, 
    {id: 3, name: 'ファンタジー'}, {id: 4, name: 'SF'}, {id: 5, name: '日常'}, 
    {id: 6, name: 'バトル'}, {id: 7, name: '恋愛'}, {id: 8, name: 'ギャグ'}, 
    {id: 9, name: 'ミステリー'}, {id: 10, name: 'ホラー'}, {id: 11, name: 'スポーツ'}, 
    {id: 12, name: '音楽'}, {id: 13, name: '異世界転生'}
  ]
end