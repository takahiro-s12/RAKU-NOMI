require 'rails_helper'

RSpec.describe HomesController, type: :controller do

  describe '#top' do
    it '正常なレスポンス' do
      get :top
      expect(response).to be_successful
    end
    it '200レスポンスが返ってくる' do
      get :top
      expect(response).to have_http_status '200'
    end
  end

  describe '#about' do
    it '正常なレスポンス' do
      get :about
      expect(response).to be_successful
    end
    it '200レスポンスが返ってくる' do
      get :about
      expect(response).to have_http_status '200'
    end
  end

end