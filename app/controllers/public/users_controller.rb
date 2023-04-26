class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  # ユーザーマイページ
  def show
    @user = current_user
    @commuting_to_hospital = CommutingToHospital.new
    @medication_history = MedicationHistory.new
    @health_history = HealthHistory.new
    @vaccination_history = VaccinationHistory.new
    @history_of_birth = HistoryOfBirth.new
    
    @commuting_to_hospitals = CommutingToHospital.all
    @medication_histories = MedicationHistory.all
    @health_histories = HealthHistory.all
    @vaccination_histories = VaccinationHistory.all
    @history_of_births = HistoryOfBirth.all
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_my_page_path(@user)
    else
      render :edit
    end
  end

  # ユーザー退会確認画面
  def unsubscribe
  end
  
  # ユーザー退会処理(ステータス更新)
  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :birthday, :email, :is_deleted)
  end
  
  def commuting_to_hospital_params
    params.require(:commuting_to_hospital).permit(:hospital_name, :day_of_a_hospital_visit, :objective)
  end
end
