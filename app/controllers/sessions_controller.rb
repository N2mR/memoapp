class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id #ログイン
      cookies.signed[:user_id] = user.id
      redirect_to root_url
      flash[:success] = "こんにちは、#{user.name}さん"
    else
      redirect_to login_url
    end
  end
end
