class CalendarController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@user_id = current_user.id
		@user_appointments = Calendar.where(user_id: @user_id)
	end
	
	def create
		@user_id = current_user.id
		@Calendar = Calendar.new(calendar_params)
    if @Calendar.save
      redirect_to "/user/#{@user_id}/calendar"
    else
      redirect_to "/user/#{@user_id}/calendar"
    end
	end

	 def show
    @event = Calendar.find(params[:id])
    @user = session[:user_id]
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
		@user_id = current_user.id
    redirect_to "/user/#{@user_id}/calendar"
  end

	private
	def calendar_params
		params.require(:calendar).permit(:category, :description, :title, :time,:user_id )
	end
end
