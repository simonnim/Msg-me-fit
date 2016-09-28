class CalendarController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@user_id = current_user.id
		@user_appointments = Calendar.where(user_id: @user_id)
	end
	
	def create
		
		
		@user_id = current_user.id
		@Calendar = Calendar.new(category: params[:category], description: params[:description], title: params[:title], time: params[:time], user_id: params[:user_id])
    if @Calendar.save
      redirect_to "/user/#{@user_id}/calendar"
			send_text_message
    else
      redirect_to "/user/#{@user_id}/calendar"
    end

	end

	 def show
    @event = Calendar.find(params[:id])
    @user = session[:user_id]
		@user_appointments = Calendar.where(user_id: @user_id)
    
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
		@user_id = current_user.id
    redirect_to "/user/#{@user_id}/calendar"
  end

	def send_text_message
		number_to_send_to = params[:number][:number_to_send_to]
		twilio_body = params[:number][:text_field]

		twilio_sid = ENV['TWILIO_ACCOUNT_SID']
		twilio_token = ENV['TWILIO_AUTH_TOKEN']
		twilio_phone_number = ENV['TWILIO_NUMBER']

		@twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

		@twilio_client.account.sms.messages.create(
			:from => twilio_phone_number,
			:to => number_to_send_to,
			:body => twilio_body
			)
	end

	# private
	# def calendar_params
	# 	params.require(:calendar).permit(:category, :description, :title, :time,:user_id )
	# end
end
