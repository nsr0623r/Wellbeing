class Public::CommutingToHospitalsController < ApplicationController
  def create
    commuting_to_hospital = CommutingToHospital.new(commuting_to_hospital_params)
    commuting_to_hospital.user_id = current_user.id
    commuting_to_hospital.save!
    @commuting_to_hospitals = CommutingToHospital.all
    @commuting_to_hospital = CommutingToHospital.find(params[:id])
  end
  
  def edit
    @commuting_to_hospital = CommutingToHospital.find(params[:id])
  end
  
  def update
    @commuting_to_hospital = CommutingToHospital.find(params[:id])
    if @commuting_to_hospital.update(commuting_to_hospital_params)
      redirect_to user_my_page_path
    else
      render :edit
      
  end
  
  def destroy
    commuting_to_hospital = CommutingToHospital.find(params[:id])
    commuting_to_hospital.destroy
    redirect_to user_my_page_path
  end
  
  private
  
  def commuting_to_hospital_params
    params.require(:commuting_to_hospital).permit(:hospital_name, :day_of_a_hospital_visit, :objective)
  end
end
