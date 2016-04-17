class Admin::RewardsController < Admin::BaseController
  before_action :set_reward, only: [:show, :update, :destroy]

  def index
    @rewards = Reward.all
  end

  def new
    @reward = Reward.new
  end

  def create
    # @user   = User.find(params[:user_id])
    @reward = Reward.new(reward_params)
    if @reward.save
      flash[:notice] = "Reward Created!"
      redirect_to admin_rewards_path
    else
      render :new
    end
  end


  def edit
    @reward = Reward.find(params[:id])
  end

  def update
    @reward = Reward.find(params[:id])

    if @reward.update(reward_params)
      redirect_to admin_rewards_path
    else
      render :edit
    end
  end

  def destroy
    @reward.destroy
    redirect_to admin_rewards_path
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :value)
  end

  def set_reward
    @reward = Reward.find(params[:id])
  end

end
