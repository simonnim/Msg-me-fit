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
		@workout = Workout.new(workout_params)
    if @workout.save
      redirect_to "/"
    else
			redirect_to '/sessions/new'
    end
	end

	private
	def workout_params
		params.require(:workout).permit(:workout, :sets, :reps, :weight, :user_id)
	end
end
