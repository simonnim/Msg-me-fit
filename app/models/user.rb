class User < ApplicationRecord
	has_many :meals
	has_many :workouts
end
