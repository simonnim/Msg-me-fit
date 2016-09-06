class Calendar < ApplicationRecord

	has_many :workouts
	has_many :meals
end
