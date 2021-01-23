
require 'rails_helper'

RSpec.describe Task, "モデルに関するテスト", type: :model do

  before do
    @user = FactoryBot.create(:user)
  end

  it "taskがある場合有効である" do
    task = FactoryBot.build(:task, user_id: @user.id)
    expect(task).to be_valid
  end

  it "taskがない場合無効である" do
    task = FactoryBot.build(:task, user_id: @user.id, task: nil)
    task.valid?
    expect(task.errors[:task]).to include("を入力してください")
  end

  it "taskが16文字以上の場合は無効である" do
    task = Task.new(task: "テストタスクテストタスクああああ", user_id: @user.id)
    task.valid?
    expect(task.errors[:task]).to include("は15文字以内で入力してください")
  end

end