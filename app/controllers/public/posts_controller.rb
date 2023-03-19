class Public::PostsController < ApplicationController
  def new
    @post = PostPhysiology.new
  end
  
  def create
    @post = PostPhysiology.new(post_params)
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
    params.require(:post_physiology).permit(:posted_text, :temperature, :weight, :body_fat_percentage, :start_time, :release,
                                            :menstrual_blood_volume, :cramps, :medicine, :physiology_start_date, :physiology_end_date, :post_id)
  end
end
