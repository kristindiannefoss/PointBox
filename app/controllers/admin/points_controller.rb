class Admin::PointsController < Admin::BaseController

  def new
    @point = Point.new
  end

  def create
    @point = User.find(point_params["user_id"]).points.new(point_params)

    if @point.save
      flash[:notice] = "Point Saved"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  # def create
  #   @user = User.find(params[:user_id])
  #   @point = @user.points.create(point_params)
  #
  #   redirect_to user_path(@point)
  # end
end

  # def show
  #   user = User.find(session[:user_id])
  #   @points = user.points
  # end

  def point_params
    params.require(:point).permit(:value, :user_id)
  end
end
