class UserController < ApplicationController

	def index
		@user = User.all
	end

	def show
		@user = User.find(session[:user_id])
	end

	def create
		@user = User.new(name: params[:name], password: params[:password], email: params[:email])
		if @user.save
			session[:user_id] = @user.id
			redirect_to '/'
		else
			render 'new'
		end
	end

	  private

	#removed to get modal to work, params are now on line 12
  # def user_params
  #   params.require(:user).permit(:name, :password, :email)
  # end
end
