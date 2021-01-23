
require 'rails_helper'

RSpec.describe Event, "モデルに関するテスト", type: :model do

  before do
    @group = Group.create(name: "テストグループ")
  end

  it "名前と日程がある場合は有効である" do
    event = FactoryBot.build(:event, group_id: @group.id)
    expect(event).to be_valid
  end

  it "名前がない場合無効である" do
    event = FactoryBot.build(:event, name: nil, group_id: @group.id)
    event.valid?
    expect(event.errors[:name]).to include("を入力してください")
  end

  it "日程がない場合は無効である" do
    event = FactoryBot.build(:event, date: nil, group_id: @group.id)
    event.valid?
    expect(event.errors[:date]).to include("を入力してください")
  end
  
  it "飲み会名が11文字以上の場合は無効である" do
    event = FactoryBot.build(:event, name: "テストイベントテスト１", group_id: @group.id)
    event.valid?
    expect(event.errors[:name]).to include("は10文字以内で入力してください")
  end
  
end