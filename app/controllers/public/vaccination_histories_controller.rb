class Public::VaccinationHistoriesController < ApplicationController
  def create
    vaccination_history = VaccinationHistory.new(vaccination_history_params)
    vaccination_history.user_id = current_user.id
    vaccination_history.save!
    @vaccination_histories = VaccinationHistory.all
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def vaccination_history_params
    params.require(:vaccination_history).permit(:inoculation_date, :amount, :vaccination)
  end
end
