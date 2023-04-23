class Public::HistoryOfBirthsController < ApplicationController
  def create
    history_of_birth = HistoryOfBirth.new(history_of_birth_params)
    history_of_birth.user_id = current_user.id
    history_of_birth.save!
    @history_of_births = HistoryOfBirth.all
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def history_of_birth_params
    params.require(:history_of_birth).permit(:date_of_birth, :parity, :method, :birth_record)
  end
end
