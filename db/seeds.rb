20.times do |n|
  User.create!(
    email: "test#{n}@test.com",
    password: "password#{n}",
    password_confirmation: "password#{n}",
    recently_sign_in: rand(Date.new(2022, 7, 1)..Date.new(2022, 7, 31))
  )
end

prefectures = [
  { code: 1, name: "北海道" },
  { code: 2, name: "青森県" },
  { code: 3, name: "岩手県" },
  { code: 4, name: "宮城県" },
  { code: 5, name: "秋田県" },
  { code: 6, name: "山形県" },
  { code: 7, name: "福島県" },
  { code: 8, name: "茨城県" },
  { code: 9, name: "栃木県" },
  { code: 10, name: "群馬県" },
  { code: 11, name: "埼玉県" },
  { code: 12, name: "千葉県" },
  { code: 13, name: "東京都" },
  { code: 14, name: "神奈川県" },
  { code: 15, name: "新潟県" },
  { code: 16, name: "富山県" },
  { code: 17, name: "石川県" },
  { code: 18, name: "福井県" },
  { code: 19, name: "山梨県" },
  { code: 20, name: "長野県" },
  { code: 21, name: "岐阜県" },
  { code: 22, name: "静岡県" },
  { code: 23, name: "愛知県" },
  { code: 24, name: "三重県" },
  { code: 25, name: "滋賀県" },
  { code: 26, name: "京都府" },
  { code: 27, name: "大阪府" },
  { code: 28, name: "兵庫県" },
  { code: 29, name: "奈良県" },
  { code: 30, name: "和歌山県" },
  { code: 31, name: "鳥取県" },
  { code: 32, name: "島根県" },
  { code: 33, name: "岡山県" },
  { code: 34, name: "広島県" },
  { code: 35, name: "山口県" },
  { code: 36, name: "徳島県" },
  { code: 37, name: "香川県" },
  { code: 38, name: "愛媛県" },
  { code: 39, name: "高知県" },
  { code: 40, name: "福岡県" },
  { code: 41, name: "佐賀県" },
  { code: 42, name: "長崎県" },
  { code: 43, name: "熊本県" },
  { code: 44, name: "大分県" },
  { code: 45, name: "宮崎県" },
  { code: 46, name: "鹿児島県" },
  { code: 47, name: "沖縄県" },
];

prefectures.length.times do |n|
  Area.create!(
    name: prefectures[n][:name]
  )
end

User.all.each do |user|
  UserProfile.create!(
    name: "test_name_#{user.id}",
    gender: rand(0..2),
    age: rand(20..50),
    self_introducement: "初めまして。\nどうぞよろしくお願いたします。",
    user_id: user.id
  )

  brands = ["Uniqlo", "GU", "ZARA", "H&M", "WEGO",
            "SPINS", "nico and...", "LOWRYS FARM", "GLOBAL WORK", "RAGEBLUE",
            "Kastane", "SNIDEL", "who's who Chico", "adidas", "Heather",
            "JEANASiS", "古着", "ehka sopo", "Lui's", "Yohji Yamamoto"]

  brands.each_with_index do |_, i|
    Brand.create!(
      name: brands[i]
    )
  end

  Post.create!(
    body: "新宿、渋谷あたりに服を見に行きたいです。\n特に綺麗めなスタイルを取り扱っているお店に行きたいです。",
    preferred_at: rand(Date.new(2022, 8, 1)..Date.new(2022, 8, 31)),
    area_id: rand(1..47),
    user_id: user.id
  )

  Post.all.each do |post|
    PostedBrand.create!(
      brand_id: rand(1..21),
      post_id: post.id
    )
    UserFavoriteBrand.create!(
      brand_id: rand(1..21),
      user_id: user.id
    )
  end
end




