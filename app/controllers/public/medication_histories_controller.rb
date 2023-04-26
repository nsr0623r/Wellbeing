class Public::MedicationHistoriesController < ApplicationController
  def create
    medication_history = MedicationHistory.new(medication_history_params)
    medication_history.user_id = current_user.id
    medication_history.save!
    @medication_histories = MedicationHistory.all
  end
  
  def edit
    @medication_history = MedicationHistory.find(params[:id])
  end
  
  def update
    @medication_history = MedicationHistory.find(params[:id])
    if @medication_history.update(medication_history_params)
      redirect_to user_my_page_path(@medication_history.user_id)
    else
      render :edit
    end
  end
  
  def destroy
    @medication_history = MedicationHistory.find(params[:id])
    @medication_history.destroy
    redirect_to user_my_page_path(@medication_history.user_id)
  end
  
  private
  
  def medication_history_params
    params.require(:medication_history).permit(:medicine, :objective, :start_date, :end_date)
  end
end
