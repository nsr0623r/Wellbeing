class Public::PostsController < ApplicationController
  def new
    @post = PostForm.new
  end
  
  def create
    @post = PostForm.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :edit
    end
  end

  def index
    @posts = Post.includes(:physiology)
  end

  def show
  end

  def edit
  end
  
  private
  
  def post_params
    params.require(:post_form).permit(:posted_text, :temperature, :weight, :body_fat_percentage, :start_time, :release,
                                            :menstrual_blood_volume, :cramps, :medicine, :physiology_start_date, :physiology_end_date, :post_id,
                                            :physical_good, :no_malfunction, :tired, :washed_out_feeling, :lumbago, :stomach_ache, :headache,
                                            :rough_skin, :chilling_exposure, :swelling, :sleepiness, :increased_appetite, :low_appetite, :chest_pain,
                                            :nausea, :dazziness, :pollakiuria, :hot_flash, :defecute, :vaginal_discharge, :vaginal_discharge_type,
                                            :vaginal_bleeding, :sex,
                                            :mental_good, :mental_normal, :frustrating, :hot_tempered, :emotional_instability,
                                            :emotional, :uneasiness, :poor_concentrtion, :lethargy, :melancholy)
  end
end
