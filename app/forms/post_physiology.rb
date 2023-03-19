class PostPhysiology
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveRecord::AttributeAssignment
  
  attr_accessor :posted_text, :temperature, :weight, :body_fat_percentage, :start_time, :release,
                :menstrual_blood_volume, :cramps, :medicine, :physiology_start_date, :physiology_end_date, :post_id
  
  def save
    @post = Post.create!(posted_text: posted_text, temperature: temperature, weight: weight, body_fat_percentage: body_fat_percentage, start_time: start_time, release: release)
    Physiology.create!(menstrual_blood_volume: menstrual_blood_volume, cramps: cramps, medicine: medicine, physiology_start_date: physiology_start_date, physiology_end_date: physiology_end_date, post_id: @post.id)
  end
end