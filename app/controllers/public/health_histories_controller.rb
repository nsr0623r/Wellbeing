class Public::HealthHistoriesController < ApplicationController
  def create
    health_history = HealthHistory.new(health_history_params)
    health_history.user_id = current_user.id
    health_history.save!
    @health_histories = HealthHistory.all
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def health_history_params
    params.require(:health_history).permit(:disease_name, :diagnostic_day, :medical_treatment, :health_comment)
  end
end
