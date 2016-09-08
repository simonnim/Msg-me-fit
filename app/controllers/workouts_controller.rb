class WorkoutsController < ApplicationController
	def index
		@user = User.find(params[:user_id])
	end

	def new
	end

	def create
		# @workout = Workout.create(workout: params[:workout], sets: params[:sets], reps: params[:reps], weight: params[:weight])
			@workout = Workout.new(workout: params[:workout])
    if @workout.save
      redirect_to "/"
    else
			redirect_to '/sessions/new'
    end
	end

	# private
	# def workout_params
	# 	params.require(:workout).permit(:workout, :sets, :reps, :weight)
	# end
end
