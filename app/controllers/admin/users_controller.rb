class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end
    
  def withdraw
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to users_path
  end
  
  private
  
  def users_params
    params.require(:user).permit(:name, :email, :birthday, :is_deleted)
  end
end
