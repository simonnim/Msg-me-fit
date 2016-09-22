class ExerciselistController < ApplicationController
	

	def create
		@workout = Workout.new(workout_params)
    if @workout.save
      redirect_to "/"
    else
			redirect_to '/sessions/new'
    end
	end

	private
	def workout_params
		params.require(:exerciselist).permit(:exercise, :muscle)
	end
end
