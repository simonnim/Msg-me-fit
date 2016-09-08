class Workout < ApplicationRecord
	belongs_to :user, class_name: "User", foreign_key: "user_id"
	belongs_to :calendar, class_name: "Calendar", foreign_key: "calendar_id"
end
