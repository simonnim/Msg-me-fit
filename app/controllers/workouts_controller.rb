class WorkoutsController < ApplicationController
	
	def index
		@user = User.find(params[:user_id])
		@exerciselistbicep = Exerciselist.where(muscle: "biceps")
		@exerciselisttricep = Exerciselist.where(muscle: "triceps")
		@exerciselistchest = Exerciselist.where(muscle: "chest")
		@exerciselistshoulder = Exerciselist.where(muscle: "shoulders")
		@exerciselistabs = Exerciselist.where(muscle: "abdominals")
		@exerciselistback = Exerciselist.where("muscle = ? or muscle = ?", "lower back", "upper back")
		@exerciselistlegs = Exerciselist.where("muscle = ? or muscle = ? or muscle = ? or muscle = ?", "quadriceps", "hamstrings", "calves", "glutes")
		
	end

	def new
	end

	def create
		@exercise = Exerciselist.new(workout_params)
    if @exercise.save
      redirect_to "/user/#{@user_id}/workouts"
    else
			redirect_to "/user/#{@user_id}/calendar"
    end
	end

	private
	def workout_params
		params.require(:exerciselist).permit(:muscle,:exercise)
	end
end
