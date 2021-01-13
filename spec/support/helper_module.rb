module TestHelper
    def sample_user
        @user = FactoryBot.create(:user)
    end


    def login(user)

        post :create, params: {
            session: {
                email: user.email,
                password: user.password
            }
        }
        session[:user_id] = user.id
        cookies.signed[:user_id] = user.id
        expect(response).to redirect_to root_url
    end

    def session_cookies(user)
        session[:user_id] = user.id
        cookies.signed[:user_id] = user.id
    end
end




RSpec.configure do |config|
    config.include TestHelper, type: :test_helper
end