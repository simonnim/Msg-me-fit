class MealsController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@meal = Meal.all
	end

	def new
		@meal = Meal.new
	end

	def create
		# calls on twilio API
		send_text_message
		redirect_to user_meals_path
	end

	def show
		@meals = Meal.all
	end


end
