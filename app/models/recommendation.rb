class Recommendation < ActiveHash::Base
  self.data = [
    {id: 1, name: '笑える'}, {id: 2, name: '感動する'}, 
    {id: 3, name: '泣ける'}, {id: 4, name: 'ほのぼの'}, {id: 5, name: '燃える'}, 
    {id: 6, name: '萌える'}, {id: 7, name: 'ハマる'}
  ]
end