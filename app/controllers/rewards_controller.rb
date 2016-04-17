class RewardsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @rewards = Reward.all
  end

  def show
    @user = User.find(params[:user_id])
    @reward = @user.rewards.find(params[:reward_id])
  end

  def new
    @user = User.find(params[:user_id])
    @reward = @user.rewards.new
  end

  def create
    @user = User.find(params[:user_id])
    @reward = @user.rewards.create(params[:reward])
    redirect_to user_rewards_path
  end
end
