class MealsController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@meal = Meal.all
	end

	def new
		@meal = Meal.new
	end

	def create
		@meal = Meal.new(meal_params)
		if @meal.save
			redirect_to "/"
		end
	end

	def show
		@meals = Meal.all
	end


	private
  def meal_params
    params.require(:meal).permit(:meal, :directions, :ingredients, :user_id)
  end
end
