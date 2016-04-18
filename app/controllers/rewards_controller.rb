class RewardsController < ApplicationController
  before_action :set_user

  def index
    @rewards = Reward.all
  end

  def new
    @reward = Reward.new
  end

  def show
    @reward = @user.rewards.find(params[:reward_id])
  end


  def create
    @reward = @user.rewards.create(reward_params)
    redirect_to user_rewards_path
  end

private

  def set_user
    @user = User.find(params[:user_id])
  end
end
