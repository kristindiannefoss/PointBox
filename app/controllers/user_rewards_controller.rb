class UserRewardsController < ApplicationController

  def new
    @user_reward = UserReward.new
  end

  def create
    @user_reward = UserReward.new(user_reward_params)
    if (@user_reward.user.points.sum(:value) - @user_reward.reward.value) >= 0
      @user_reward.save
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
    @user_reward = UserReward.find(params[:user_id])
  end

  private

  def user_reward_params
    params.require(:user_reward).permit(:user_id, :reward_id)
  end

  # def enough_points
  #
  # end

end