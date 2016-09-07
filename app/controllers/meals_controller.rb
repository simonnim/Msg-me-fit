class MealsController < ApplicationController

	def index
		@user = User.find(params[:user_id])
	end

	def new

	end

	def create
		@meal = Meal.create(meal: params[:meal])
		
	end
end
