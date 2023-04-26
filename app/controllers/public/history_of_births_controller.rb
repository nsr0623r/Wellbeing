class Public::HistoryOfBirthsController < ApplicationController
  def create
    history_of_birth = HistoryOfBirth.new(history_of_birth_params)
    history_of_birth.user_id = current_user.id
    history_of_birth.save!
    @history_of_births = HistoryOfBirth.all
  end
  
  def edit
    @history_of_birth = HistoryOfBirth.find(params[:id])
  end
  
  def update
    @history_of_birth = HistoryOfBirth.find(params[:id])
    if @history_of_birth.update(history_of_birth_params)
      redirect_to user_my_page_path(@history_of_birth.user_id)
    else
      render :edit
    end
  end
  
  def destroy
    @history_of_birth = HistoryOfBirth.find(params[:id])
    @history_of_birth.destroy
    redirect_to user_my_page_path(@history_of_birth.user_id)
  end
  
  private
  
  def history_of_birth_params
    params.require(:history_of_birth).permit(:date_of_birth, :parity, :method, :birth_record)
  end
end
