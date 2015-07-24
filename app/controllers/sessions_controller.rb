class SessionsController < ApplicationController
  def new
  end

  # ログイン
  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to admin_root_path, :notice => "ログインしました"
    else
      flash.now.alert = "Emailかpasswordが間違っています"
    end
  end

  # ログアウト
  def destroy
    logout
    redirect_to admin_root_path, :notice => "ログアウトしました"
  end
end
