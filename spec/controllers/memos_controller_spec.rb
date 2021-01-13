require 'rails_helper'

RSpec.describe MemosController, type: :controller do
		describe 'メモコントローラのテスト', type: :test_helper do
			before 'ユーザーの設定' do
				@user = sample_user
				login(@user)
				session_cookies(@user)
			end

			context 'index' do
				it '正常にアクセスできるか' do 
					get :index
					expect(response).to have_http_status(:succes)
				end
			end

			# context 'show' do
			# end

			# context 'new' do
			# end

			# context 'create' do
			# end

			# context 'edit' do
			# end

			# context 'update' do
			# end

			# context 'destroy' do
			# end
    end
end
