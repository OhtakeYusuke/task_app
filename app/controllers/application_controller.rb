class ApplicationController < ActionController::Base
  # current_userメソッドの定義
  helper_method :current_user
  # ログインの有無の確認
  before_action :login_required

  private
  # ログインしていた場合の、ユーザーの情報
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_path unless current_user
  end

end
