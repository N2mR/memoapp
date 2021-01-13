require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe 'ユーザーコントローラーのテスト', type: :test_helper do

		it 'ユーザーが正しく作成されるか' do
			@user = User.new(name: 'ayumu', email: 'hogehoge@example.com', password:
												'password', password_confirmation: 'password')
			expect(@user.valid?).to eq true
		end
	end
end
