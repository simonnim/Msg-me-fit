class UserController < ApplicationController

	def index
		@user = User.all
	end
end
