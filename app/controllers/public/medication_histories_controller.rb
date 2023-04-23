class Public::MedicationHistoriesController < ApplicationController
  def create
    medication_history = MedicationHistory.new(medication_history_params)
    medication_history.user_id = current_user.id
    medication_history.save!
    @medication_histories = MedicationHistory.all
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def medication_history_params
    params.require(:medication_history).permit(:medicine, :objective, :start_date, :end_date)
  end
end
