class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :destroy]
  before_action :baria_topic, only: [:show]
  before_action :baria_topics, only: [:index]

  def index
    @topics = Topic.all.page(params[:page]).per(6)
    @user = current_user
  end

  def show
    @recommends = Recommend.all
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to topic_path(@topic)
    else
      @user = current_user
      render 'users/show'
    end
  end

  def destroy
    @topic.destroy
    redirect_to user_path(current_user)
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :text)
  end

  def baria_topic
    topic = Topic.find(params[:id])
    unless current_user.isRecommender.present? or topic.user_id == current_user.id
      flash[:alert] = "ページ遷移できません"
      redirect_to user_path(current_user)
    end
  end

  def baria_topics
    unless current_user.isRecommender.present?
      flash[:alert] = "ページ遷移できません"
      redirect_to user_path(current_user)
    end
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

end
