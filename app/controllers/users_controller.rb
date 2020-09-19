class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :baria_user, only: [:show, :edit, :update, :roles]
  before_action :set_user, only: [:show, :profile, :edit, :update, :roles]
  @@mode = "edit"

  def show
    @topic = Topic.new
    @topics = Topic.where(user_id: current_user.id)
  end

  def profile
  end

  def edit
    @@mode = "edit"
  end

  def roles
    @@mode = "roles"
  end

  def update
    if @@mode == "roles"
      @user.isRecommender = true
    end
    if @user.update(user_params)
      @@mode = "edit"
      redirect_to user_path(@user)
    else
      if @@mode == "roles"
        render :roles
      else
        render :edit
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :gender,
                                 :age, :height, :weight, :west, :hip, :chest, :isRecommender,
                                 :real_name, :phone_number, :address)
  end

  def baria_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
