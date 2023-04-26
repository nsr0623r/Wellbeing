class Public::HealthHistoriesController < ApplicationController
  def create
    health_history = HealthHistory.new(health_history_params)
    health_history.user_id = current_user.id
    health_history.save!
    @health_histories = HealthHistory.all
  end
  
  def edit
    @health_history = HealthHistory.find(params[:id])
  end
  
  def update
    @health_history = HealthHistory.find(params[:id])
    if @health_history.update(health_history_params)
      redirect_to user_my_page_path(@health_history.user_id)
    else
      render :edit
    end
  end
  
  def destroy
    @health_history = HealthHistory.find(params[:id])
    @health_history.destroy
    redirect_to user_my_page_path(@health_history.user_id)
  end
  
  private
  
  def health_history_params
    params.require(:health_history).permit(:disease_name, :diagnostic_day, :medical_treatment, :health_comment)
  end
end
