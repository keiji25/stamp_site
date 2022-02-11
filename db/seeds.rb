hina_prize = [
    "macbook Air",
    "ipad pro 128GB wifiモデル",
    "dyson Cyclone V10 Fluffy",
    "Nintendo Switchホワイト 有機EL",
    "選べる北海道海の幸ギフト",
    "Anker PowerCore III 19200 60W",
    "FUJIFILM インスタントカメラ チェキ",
    "松阪牛・神戸牛・米沢牛 選べるカタログギフト TMコース",
    "クオカード(３０００円)",
    "ホットアイマスク USB 電熱式 蒸気",
    "ベッドサイドランプ",
    "ブローハイ",
    "かまトゥグッズ"
]

hina_qty = [
    1,
    1,
    1,
    1,
    5,
    5,
    5,
    5,
    10,
    5,
    5,
    1,
    2000
]

hina_category = [
    "豪華",
    "豪華",
    "豪華",
    "豪華",
    "中間",
    "中間",
    "中間",
    "中間",
    "中間",
    "中間",
    "中間",
    "中間",
    "参加賞"
]

hina_prize.each_with_index do |p, cnt|
    Prize.create!(
        prize: p,
        kind: "ひなまつり",
        qty: hina_qty[cnt],
        category: hina_category[cnt],
        image: "/images/noimage.png"
    )
end

vale_prize = [
    "Nintendo Switch",
    "Panasonic ヘアドライヤー",
    "ペアクルージングチケット",
    "選べる国産牛",
    "One's Towel Lab",
    "象印",
    "Anker",
    "IPSA",
    "参加賞"
]

vale_qty = [
    1,
    1,
    2,
    4,
    4,
    4,
    4,
    1,
    200
]

vale_category = [
    "豪華",
    "豪華",
    "豪華",
    "中間",
    "中間",
    "中間",
    "中間",
    "中間",
    "参加賞"
]

vale_prize.each_with_index do |p, cnt|
    Prize.create!(
        prize: p,
        kind: "バレンタイン",
        qty: vale_qty[cnt],
        category: vale_category[cnt],
        image: "/images/noimage.png"
    )
end