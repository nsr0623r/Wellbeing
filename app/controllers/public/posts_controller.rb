class Public::PostsController < ApplicationController
  before_action :physical_string, only: [:create, :update]
  # before_action :mental_string, only: [:create, :update]
  # before_action :pregnancy_string, only: [:create, :update]
  
  def new
    @post = PostForm.new
    @calendar = Calendar.all
  end
  
  def create
    @post = PostForm.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.published
    @privates = Post.unpublished
    # @posts = Post.all
    @post_comment = PostComment.new
  end

  def show
    @post = Post.find(params[:id])
    # @user = @post.user
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
  def physical_string
    params[:post_form][:physical] = params[:post_form][:physical].join("/")
  end
  
  # def mental_string
  #   params[:post_form][:mental] = params[:post_form][:mental].join("/")
  # end
  
  # def pregnancy_string
  #   params[:post_form][:pregnancy] = params[:post_form][:pregnancy].join("/")
  # end
  
  def post_params
    params.require(:post_form).permit(:posted_text, :temperature, :weight, :body_fat_percentage, :start_time, :release,:user_id, :image,
                                      :menstrual_blood_volume, :cramps, :medicine, :physiology_start_date, :physiology_end_date, :post_id,
                                      :physical_good, :no_malfunction, :tired, :washed_out_feeling, :lumbago, :stomach_ache, :headache,
                                      :rough_skin, :chilling_exposure, :swelling, :sleepiness, :increased_appetite, :low_appetite, :chest_pain,
                                      :nausea, :dazziness, :pollakiuria, :hot_flash, :defecute, :vaginal_discharge, :vaginal_discharge_type,
                                      :vaginal_bleeding, :sex, :mental, :pregnancy,
                                      :mental_good, :mental_normal, :frustrating, :hot_tempered, :emotional_instability,
                                      :emotional, :uneasiness, :poor_concentrtion, :lethargy, :melancholy,
                                      :morning_sickness, :belching, :backache_during_pregnancy, :anaemia, :sour_stomach, :pulsation, :checkbox, :physical)
  end
end
