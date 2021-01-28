require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:user)
  end

  describe '#show' do
    context 'ログインしていない場合' do
      before do
        get :show, params: { id: @user.id }
      end

      it '正常にレスポンスが返らない' do
        expect(response).not_to be_successful
      end
      it '302レスポンスが返っている' do
        expect(response).to have_http_status '302'
      end
      it 'ログインページに遷移する' do
        expect(response).to redirect_to "/users/sign_in"
      end
    end

    context 'ログインしている場合' do
      before do
        sign_in @user
        get :show, params: { id: @user.id }
      end

      it '正常にレスポンスが返る' do
        expect(response).to be_successful
      end
      it '200レスポンスが返っている' do
        expect(response).to have_http_status '200'
      end
    end
  end

  describe '#edit' do
    context 'ログインしていない場合' do
      before do
        get :edit, params: { id: @user.id }
      end

      it '正常にレスポンスが返らない' do
        expect(response).not_to be_successful
      end
      it '302レスポンスが返っている' do
        expect(response).to have_http_status '302'
      end
      it 'ログインページに遷移している' do
        expect(response).to redirect_to "/users/sign_in"
      end
    end

    context 'ログインしている場合' do
      before do
        sign_in @user
      end

      it '正常にレスポンスが返る' do
        get :edit, params: { id: @user.id }
        expect(response).to be_successful
      end
      it '200レスポンスが返っている' do
        get :edit, params: { id: @user.id }
        expect(response).to have_http_status '200'
      end
      it '他のユーザーの編集しようとした時にマイページに遷移する' do
        get :edit, params: { id: @another_user.id }
        expect(response).to redirect_to user_path(@user)
      end
    end
  end

  describe '#update' do
    context 'ログインしていない場合' do
      before do
        user_params = { family_name: '加藤' }
        patch :update, params: { id: @user.id, user: user_params }
      end

      it '正常にレスポンスが返らない' do
        expect(response).not_to be_successful
      end
      it '302レスポンスが返っている' do
        expect(response).to have_http_status '302'
      end
      it 'ログイン画面に遷移している' do
        expect(response).to redirect_to "/users/sign_in"
      end
    end

    context 'ログインしていて、内容が正しい場合' do
      before do
        sign_in @user
        user_params = { family_name: '加藤' }
        patch :update, params: { id: @user.id, user: user_params }
      end

      it '正常に更新できているか' do
        expect(@user.reload.family_name).to eq '加藤'
      end
      it '更新した後、マイページに遷移しているか' do
        expect(response).to redirect_to user_path(@user)
      end
    end

    context 'ログインしていて内容が正しくない場合' do
      before do
        sign_in @user
        user_params = { family_name: nil }
        patch :update, params: { id: @user.id, user: user_params }
      end

      it '更新できていない' do
        expect(@user.reload.family_name).to eq 'テスト'
      end
    end
  end

  describe '#search' do
    context 'ログインしていない場合' do
      before do
        get :search, params: { id: @user.id }
      end

      it '正常にレスポンスが返らない' do
        expect(response).not_to be_successful
      end
      it '302レスポンスが返ってくる' do
        expect(response).to have_http_status '302'
      end
      it 'ログイン画面に遷移する' do
        expect(response).to redirect_to "/users/sign_in"
      end
    end

    context 'ログインしている場合' do
      before do
        sign_in @user
        get :search, params: { id: @user.id }
      end

      it '正常にレスポンスが返る' do
        expect(response).to be_successful
      end
      it '200レスポンスが返る' do
        expect(response).to have_http_status '200'
      end
    end
  end
end
