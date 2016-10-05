class UserController < ApplicationController

	def index
		@user = User.all
	end

	def show
		@user = User.find(session[:user_id])
		@stats = Stats.where(user_id: @user.id)
		@calendar = Calendar.where(user_id: @user.id)
	end

	def create
		@user = User.new(name: params[:name], password: params[:password], email: params[:email])
		@stats = Stats.new(weight: params[:weight], bench: params[:bench], squat: params[:squat],deadlift: params[:deadlift], overheadpress: params[:overheadpress], barbellrow: params[:barbellrow], user_id: params[:user_id])
		if @user.save
			session[:user_id] = @user.id
			redirect_to '/user/show'
		elsif @stats.save
			redirect_to '/user/show'
		end
	end

	  private

	#removed to get modal to work, params are now on line 12
  # def user_params
  #   params.require(:user).permit(:name, :password, :email)
  # end
end
