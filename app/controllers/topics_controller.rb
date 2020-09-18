class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :destroy]
  before_action :baria_topic, only: [:show]

  def index
    @topics = Topic.all
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
    params.require(:topic).permit(:image)
  end

  def baria_topic
    topic = Topic.find(params[:id])
    unless topic.user_id == current_user.id
      flash[:alert] = "ページ遷移できません"
      redirect_back fallback_location: request.url
    end
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

end
