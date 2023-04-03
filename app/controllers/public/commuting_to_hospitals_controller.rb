class Public::CommutingToHospitalsController < ApplicationController
  def create
    commuting_to_hospital = CommutingToHospital.new(commuting_to_hospital_params)
    commuting_to_hospital.user_id = current_user.id
    commuting_to_hospital.save!
    @commuting_to_hospitals = CommutingToHospital.all
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def commuting_to_hospital_params
    params.require(:commuting_to_hospital).permit(:hospital_name, :day_of_a_hospital_visit, :objective)
  end
end
