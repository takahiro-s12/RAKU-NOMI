# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#ユーザー
User.create!(family_name: "テスト", first_name: "ユーザー", nickname: "テスト", birthday: "1996-10-09", favorite_food: "すき焼き", favorite_drink: "レモンサワー", hated_food: "パクチー", image: File.open("./app/assets/images/icon1.jpg"), password: "test1234", email: "test@test.co.jp")
User.create!(family_name: "山田", first_name: "太郎", nickname: "タロー", birthday: "1995-03-02", favorite_food: "やきとり", favorite_drink: "ビール", hated_food: "野菜全般", image: File.open("./app/assets/images/icon2.png"), password: "000000", email: "test2@test.co.jp")
User.create!(family_name: "佐藤", first_name: "綾香", nickname: "あやか", birthday: "1998-05-23", favorite_food: "かぼちゃ", favorite_drink: "カシオレ", hated_food: "特になし", image: File.open("./app/assets/images/icon3.png"), password: "000000", email: "test3@test.co.jp")
User.create!(family_name: "鈴木", first_name: "康太", nickname: "こーた", birthday: "1993-08-28", favorite_food: "唐揚げ", favorite_drink: "ハイボール", hated_food: "チーズ", image: File.open("./app/assets/images/icon4.png"), password: "000000", email: "test4@test.co.jp")
User.create!(family_name: "高橋", first_name: "真由美", nickname: "まゆ", birthday: "1995-05-03", favorite_food: "ヤンニョムチキン", favorite_drink: "チャミスル", hated_food: "海鮮系", image: File.open("./app/assets/images/icon5.jpg"), password: "000000", email: "test5@test.co.jp")
User.create!(family_name: "田端", first_name: "一成", nickname: "いっせー", birthday: "1994-11-12", favorite_food: "寿司", favorite_drink: "緑茶ハイ", hated_food: "トマト", image: File.open("./app/assets/images/icon6.png"), password: "000000", email: "test6@test.co.jp")
User.create!(family_name: "橋本", first_name: "智哉", nickname: "ともや", birthday: "1996-12-25", favorite_food: "しめ鯖", favorite_drink: "日本酒", hated_food: "辛い物", image: File.open("./app/assets/images/icon7.jpg"), password: "000000", email: "test7@test.co.jp")
User.create!(family_name: "島田", first_name: "彩音", nickname: "あやね", birthday: "1994-02-10", favorite_food: "たこ焼き", favorite_drink: "レモンサワー", hated_food: "なす", image: File.open("./app/assets/images/icon8.jpg"), password: "000000", email: "test8@test.co.jp")

#相互フォローをしているユーザー(user2~6)
Relationship.create!(followed_id:1,follower_id:2)
Relationship.create!(followed_id:2,follower_id:1)
Relationship.create!(followed_id:1,follower_id:3)
Relationship.create!(followed_id:3,follower_id:1)
Relationship.create!(followed_id:1,follower_id:4)
Relationship.create!(followed_id:4,follower_id:1)
Relationship.create!(followed_id:1,follower_id:5)
Relationship.create!(followed_id:5,follower_id:1)
Relationship.create!(followed_id:1,follower_id:6)
Relationship.create!(followed_id:6,follower_id:1)

#user1がフォローしているだけのユーザー
Relationship.create!(followed_id:1,follower_id:7)

#user1がフォローされているだけのユーザー
Relationship.create!(followed_id:8,follower_id:1)

#グループ作成
Group.create!(name: "長谷部ゼミ")
Group.create!(name: "テニス部")
Group.create!(name: "ケイエス(株)")

#グループユーザーの作成
GroupUser.create!(user_id:1,group_id:1)
GroupUser.create!(user_id:2,group_id:1)
GroupUser.create!(user_id:3,group_id:1)
GroupUser.create!(user_id:4,group_id:1)
GroupUser.create!(user_id:5,group_id:1)
GroupUser.create!(user_id:1,group_id:2)
GroupUser.create!(user_id:3,group_id:2)
GroupUser.create!(user_id:5,group_id:2)
GroupUser.create!(user_id:8,group_id:2)
GroupUser.create!(user_id:1,group_id:3)
GroupUser.create!(user_id:2,group_id:3)
GroupUser.create!(user_id:4,group_id:3)
GroupUser.create!(user_id:7,group_id:3)

#イベントの作成
Event.create!(group_id:1, name: "新年会", venue_name: "魚民", venue_address: "東京都豊島区南池袋1-23-6", date: "2022-01-06", start_time: "2022-01-06 19:00:00", finish_time: "2022-01-06 21:00:00", cost: "30000", comment: "毎年恒例の新年会！みんなで盛り上がりましょう！", user_id: 1)
Event.create!(group_id:1, name: "送別会", venue_name: "いちげん", venue_address: "埼玉県さいたま市南区南本町2-26", date: "2022-06-28", start_time: "2022-06-28 21:00:00", finish_time: "2022-06-28 23:00:00", cost: "36000", comment: "21時開始なので時間厳守でお願いします。")
Event.create!(group_id:1, name: "月飲み", venue_name: "小池", venue_address: "東京都 豊島区 東池袋 1-20-18", date: "2022-03-31", start_time: "2022-03-31 19:30:00", finish_time: "2022-03-31 21:00:00", cost: "28000")

#イベントユーザーの作成
EventUser.create!(event_id: 1, user_id: 1)
EventUser.create!(event_id: 1, user_id: 2)
EventUser.create!(event_id: 1, user_id: 3)
EventUser.create!(event_id: 1, user_id: 4)
EventUser.create!(event_id: 1, user_id: 5)
EventUser.create!(event_id: 2, user_id: 1)
EventUser.create!(event_id: 2, user_id: 2)
EventUser.create!(event_id: 2, user_id: 3)
EventUser.create!(event_id: 2, user_id: 4)
EventUser.create!(event_id: 3, user_id: 1)
EventUser.create!(event_id: 3, user_id: 3)
EventUser.create!(event_id: 3, user_id: 5)

