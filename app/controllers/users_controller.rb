class UsersController < ApplicationController

  def new
    User.new
  end
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to root_url
    else
      render :new
    end
  end
  

    private

      def user_params
        params.permit(:name,:email,:password,:password_confirmation)
      end
end
