class Public::GraphsController < ApplicationController
  def index
    @temperature_hash = Hash.new
    date_ary = (Date.new(2023, 1, 1)..Date.new(2023, 4, 1)).select{|date| date.day == 1}
    date_ary.each_with_index do |d, idx|
      @temperature_date = Post.where(created_at: (d)..(date_ary[idx + 1]))
      @temperature_date = @temperature_date.where.not(temperature: nil, weight: nil, body_fat_percentage: nil).map {|post| [post.created_at, post.temperature]}
      @temperature_hash.store(idx, @temperature_date)
    end
    
    @weight_hash = Hash.new
    date_ary = (Date.new(2023, 1, 1)..Date.new(2023, 4, 1)).select{|date| date.day == 1}
    date_ary.each_with_index do |d, idx|
      @weight_date = Post.where(created_at: (d)..(date_ary[idx + 1]))
      @weight_date = @weight_date.where.not(weight: nil).map {|post| [post.created_at, post.weight]}
      @weight_hash.store(idx, @weight_date)
    end
    
    @body_fat_percentage_hash = Hash.new
    date_ary = (Date.new(2023, 1, 1)..Date.new(2023, 4, 1)).select{|date| date.day == 1}
    date_ary.each_with_index do |d, idx|
      @body_fat_percentage_date = Post.where(created_at: (d)..(date_ary[idx + 1]))
      @body_fat_percentage_date = @body_fat_percentage_date.where.not(body_fat_percentage: nil).map {|post| [post.created_at, post.body_fat_percentage]}
      @body_fat_percentage_hash.store(idx, @body_fat_percentage_date)
    end
  end

  def show
  end
end
