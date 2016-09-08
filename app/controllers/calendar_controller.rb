class CalendarController < ApplicationController
	def index
		@user_id = current_user.id
		@user_appointments = Calendar.where(user_id: @user_id)
	end
	
end
