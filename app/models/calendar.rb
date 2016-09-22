class Calendar < ApplicationRecord

	has_many :workouts
	has_many :meals

	def start_time
		self.time
	end
end
