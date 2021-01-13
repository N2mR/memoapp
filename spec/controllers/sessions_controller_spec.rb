require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'セッションコントローラーのテスト', type: :test_helper do
    before 'ユーザーを用意する' do
        @user = sample_user
    end
    it 'ログイン機能' do
      login(@user)
    end
    it '不正な値ではログインできない' do
      
      post :create, params: {
        session: {
          email: 'hogehoge@example.com',
          password: 'password'
        }
      }
      expect(response).to redirect_to login_url
    end

    it '正常にログアウトできているかどうか' do 
      login(@user)
      session_cookies(@user)
      delete :destroy
      expect(response).to redirect_to login_url
      #ログアウト時にセッションとクッキーを削除することができているかどうか
      expect(cookies.signed[:user_id]).to eq (nil)
      expect(session[:user_id]).to eq (nil)
    end
  end
end
