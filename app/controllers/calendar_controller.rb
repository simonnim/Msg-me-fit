class CalendarController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@user_id = current_user.id
		@user_appointments = Calendar.where(user_id: @user_id)
	end
	
	def create
		@Calendar = Calendar.new(calendar_params)
    if @Calendar.save
      redirect_to "/"
    else
			redirect_to '/sessions/new'
    end
	end

	private
	def calendar_params
		params.require(:calendar).permit(:exercise, :time, :user_id )
	end
end
