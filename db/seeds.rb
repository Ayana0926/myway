# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#デフォルトタグ
Tag.create([
  { name: 'ショップ' },
  { name: '公園' },
  { name: '駅' },
  { name: '散歩' },
  { name: '寄り道' },
  { name: '図書館' },
  { name: '地図' },
  { name: '交通規制' }
])