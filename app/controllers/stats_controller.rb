class StatsController < ApplicationController
	def create
		@stats = Stats.new(weight: params[:weight], bench: params[:bench], squat: params[:squat],deadlift: params[:deadlift], overheadpress: params[:overheadpress], barbellrow: params[:barbellrow])
		if @stats.save
			session[:user_id] = @user.id
			redirect_to '/user/show'
		else
			render '/'
		end
	end

end