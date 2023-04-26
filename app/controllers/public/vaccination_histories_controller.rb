class Public::VaccinationHistoriesController < ApplicationController
  def create
    vaccination_history = VaccinationHistory.new(vaccination_history_params)
    vaccination_history.user_id = current_user.id
    vaccination_history.save!
    @vaccination_histories = VaccinationHistory.all
  end
  
  def edit
    @vaccination_history = VaccinationHistory.find(params[:id])
  end
  
  def update
    @vaccination_history = VaccinationHistory.find(params[:id])
    if @vaccination_history.update(vaccination_history_params)
      redirect_to user_my_page_path(@vaccination_history.user_id)
    else
      render :edit
    end
  end
  
  def destroy
    @vaccination_history = VaccinationHistory.find(params[:id])
    @vaccination_history.destroy
    redirect_to user_my_page_path(@vaccination_history.user_id)
  end
  
  private
  
  def vaccination_history_params
    params.require(:vaccination_history).permit(:inoculation_date, :amount, :vaccination)
  end
end
