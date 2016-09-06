class MealsController < ApplicationController

	def index
		@user = User.find(params[:user_id])
	end

	def new

	end

	def create
		
	end
end
