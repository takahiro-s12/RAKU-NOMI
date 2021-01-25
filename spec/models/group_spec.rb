require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "バリデーションテスト" do
    it "グループ名がある場合は有効である" do
      group = Group.new(name: "テストグループ")
      expect(group).to be_valid
    end

    it "グループ名がない場合は無効である" do
      group = Group.new(name: nil)
      group.valid?
      expect(group.errors[:name]).to include("を入力してください")
    end

    it "グループ名が15文字以上の時は無効である" do
      group = Group.new(name: "テストグループテストグループ１１")
      group.valid?
      expect(group.errors[:name]).to include("は15文字以内で入力してください")
    end
  end
end
