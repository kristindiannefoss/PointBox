class UserRewardsController < ApplicationController
  before_action :set_user_reward, only: [:new, :edit, :create]

  def new
    user = User.find(params[:user_id])
    reward = Reward.find(params[:reward_id])
    @user_reward = user.reward
  end

  def create
    if @user_reward.save
        @user_reward << user.reward
        flash[:notice] = "Successfully Purchased"
        redirect_to user_path(@user_reward.user_id)
    else
      flash[:notice] = "Insufficient Points"
      render :new
    end
    # if @user_reward.save
    #   flash[:notice] = "Successfully Purchased"
    #   redirect_to user_path(@user_reward.user_id)
    # else
    #   flash[:notice] = "Insufficient Points"
    #   render :new
    # end
  end

  def index
    @user_rewards = UserReward.all
  end

  def show
    @user_reward = UserReward.find(params[:id])
  end

  private

  def user_reward_params
    params.require(:user_reward).permit(:user_id, :reward_id)
  end

  # def enough_points
  #(@user_reward.user.points.sum(:value) - @user_reward.reward.value) >= 0
  # end

  def set_user_reward
    user = User.find(params[:user_id])
    reward = Reward.find(params[:reward_id])

  end

end
