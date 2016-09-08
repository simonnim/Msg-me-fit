class User < ApplicationRecord
	has_many :meals
	has_many :workouts
	has_many :calendars
	has_secure_password
end
