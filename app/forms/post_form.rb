class PostForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveRecord::AttributeAssignment
  
  attr_accessor :posted_text, :temperature, :weight, :body_fat_percentage, :start_time, :release,
                :menstrual_blood_volume, :cramps, :medicine, :physiology_start_date, :physiology_end_date, :post_id,
                :physical_good, :no_malfunction, :tired, :washed_out_feeling, :lumbago, :stomach_ache, :headache, :rough_skin, :chilling_exposure,
                :swelling, :sleepiness, :increased_appetite, :low_appetite, :chest_pain, :nausea, :dazziness, :pollakiuria, :hot_flash, :defecute,
                :vaginal_discharge, :vaginal_discharge_type, :vaginal_bleeding, :sex,
                :mental_good, :mental_normal, :frustrating, :hot_tempered, :emotional_instability, :emotional, :uneasiness, :poor_concentrtion,
                :lethargy, :melancholy,
                :morning_sickness, :belching, :backache_during_pregnancy, :anaemia, :sour_stomach, :pulsation
  
  def save
    @post = Post.create!(posted_text: posted_text, temperature: temperature, weight: weight, body_fat_percentage: body_fat_percentage, start_time: start_time, release: release)
    Physiology.create!(menstrual_blood_volume: menstrual_blood_volume, cramps: cramps, medicine: medicine, physiology_start_date: physiology_start_date, physiology_end_date: physiology_end_date, post_id: @post.id)
    PhysicalSymptom.create!(physical_good: physical_good, no_malfunction: no_malfunction, tired: tired, washed_out_feeling: washed_out_feeling,
                            lumbago: lumbago, stomach_ache: stomach_ache, headache: headache, rough_skin: rough_skin, chilling_exposure: chilling_exposure,
                            swelling: swelling, sleepiness: sleepiness, increased_appetite: increased_appetite, low_appetite: low_appetite,
                            chest_pain: chest_pain, nausea: nausea, dazziness: dazziness, pollakiuria: pollakiuria, hot_flash: hot_flash, defecute: defecute,
                            vaginal_discharge: vaginal_discharge, vaginal_discharge_type: vaginal_discharge_type, vaginal_bleeding: vaginal_bleeding,
                            sex: sex, post_id: @post.id)
    MentalManifestation.create!(mental_good: mental_good, mental_normal: mental_normal, frustrating: frustrating, hot_tempered: hot_tempered,
                                emotional_instability: emotional_instability, emotional: emotional, uneasiness: uneasiness, poor_concentrtion: poor_concentrtion,
                                lethargy: lethargy, melancholy: melancholy, post_id: @post.id)
    Pregnancy.create!(morning_sickness: morning_sickness, belching: belching, backache_during_pregnancy: backache_during_pregnancy, anaemia: anaemia,
                      sour_stomach: sour_stomach, pulsation: pulsation, post_id: @post.id)
  end
end