require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "バリデーションテスト" do
    before do
      @group = Group.create(name: "テストグループ")
    end

    it "アンケート内容、候補日１がある場合は有効である" do
      question = FactoryBot.build(:question, group_id: @group.id)
      expect(question).to be_valid
    end

    it "アンケート内容がない場合は無効である" do
      question = FactoryBot.build(:question, group_id: @group.id, title: nil)
      question.valid?
      expect(question.errors[:title]).to include("を入力してください")
    end

    it "候補日１がない場合は無効である" do
      question = FactoryBot.build(:question, group_id: @group.id, first_candidate: nil)
      question.valid?
      expect(question.errors[:first_candidate]).to include("を入力してください")
    end
  end
end
