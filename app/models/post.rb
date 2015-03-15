class Post < ActiveRecord::Base
	#belongs_to :user - edit per video?
	belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

end