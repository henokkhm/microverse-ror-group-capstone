class FoodsController < ApplicationController
  def new
    @food = Food.new
  end

  def index
    @user = User.find(params[:user_id])
    @foods = Food.includes(:user).where(user_id: @user.id)
  end

  def create
    @food = Food.new(new_food)
    @food.user = User.find(params[:user_id]) # current_user after authentication is made

    if @food.save
      redirect_to foods_path
      flash[:notice] = 'New food added!'
    else
      flash[:alert] = "Error! #{@food.errors.full_messages}"
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy!
    flash[:success] = 'Food deleted successfully!'
    redirect_to foods_path
  end

  private

  def new_food
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
