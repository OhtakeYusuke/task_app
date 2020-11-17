class Admin::UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "#{@user.name} を登録しました"
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "#{@user.name} を編集しました"
    else
      render :new
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to admin_users_url, notice: "#{@user.name} を削除しました"
  end

end


private
def user_params
  params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
end
