require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションテスト" do
    it "姓、名、ニックネーム、メールアドレス、パスワードがある場合有効である" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it "姓がない場合無効である" do
      user = FactoryBot.build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "名がない場合無効である" do
      user = FactoryBot.build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "ニックネームがない場合無効である" do
      user = FactoryBot.build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "ニックネームが11文字以上は無効である" do
      user = FactoryBot.build(:user, nickname: "あああああああああああ")
      user.valid?
      expect(user.errors[:nickname]).to include("は10文字以内で入力してください")
    end

    it "メールアドレスがない場合無効である" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "アドレスが重複している場合、無効である" do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.build(:user)
      user2.valid?
      expect(user2.errors[:email]).to include("はすでに存在します")
    end

    it "パスワードがない場合無効である" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "好きな食べ物が11文字以上なら無効である" do
      user = FactoryBot.build(:user, favorite_food: "すき焼き、唐揚げ、餃子、サムギョプサル")
      user.valid?
      expect(user.errors[:favorite_food]).to include("は10文字以内で入力してください")
    end

    it "好きな飲み物が11文字以上なら無効である" do
      user = FactoryBot.build(:user, favorite_drink: "カクテル、ビール、日本酒")
      user.valid?
      expect(user.errors[:favorite_drink]).to include("は10文字以内で入力してください")
    end

    it "嫌いな食べ物が11文字以上なら無効である" do
      user = FactoryBot.build(:user, hated_food: "ヤサイとゴハンとサカナ")
      user.valid?
      expect(user.errors[:hated_food]).to include("は10文字以内で入力してください")
    end
  end
end
