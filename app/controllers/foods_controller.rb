class FoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @food = Food.new
  end

  def index
    @foods = Food.includes(:user).where(user_id: current_user)
  end

  def create
    @food = Food.new(new_food)
    @food.user = current_user

    if @food.save
      flash[:notice] = 'New food added!'
      redirect_to foods_path
    else
      flash[:alert] = "Error! " + @food.errors.full_messages.join(', ')
      redirect_to new_food_path
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
