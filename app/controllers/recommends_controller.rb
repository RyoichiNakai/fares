class RecommendsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_recommender

  def new
    @topic = Topic.find(params[:topic_id])
    @recommend = Recommend.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @recommend = @topic.recommends.new(recommend_params)
    @recommend.user_id = current_user.id
    # @todo:ここうまくいくかわからん
    if @recommend.save
      redirect_to edit_topic_recommend_path(@topic, @recommend)
    else
      @recommends = Recommend.all
      render 'topics/show'
    end
  end

  def destroy
    Recommend.find_by(id: params[:id], topic_id: params[:topic_id]).destroy
    redirect_to topic_path(params[:topic_id])
  end

  private
  def recommend_params
    params.require(:recommend).permit(:comment, :image)
  end

  # @todo: レコメンダになるページを実装した後にそのページに遷移
  def is_recommender
    if current_user.isRecommender == false
      redirect_to user_path(current_user)
    end
  end
end
