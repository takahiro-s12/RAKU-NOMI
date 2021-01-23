FactoryBot.define do
  factory :user do
    family_name {"テスト"}
    first_name {"ユーザー"}
    nickname {"テスト"}
    email {"testtest@testtest"}
    birthday {"1994-12-02"}
    favorite_food {"唐揚げ"}
    favorite_drink {"ビール"}
    hated_food {"特になし"}
    password {"password"}
  end
end