class Post < ActiveRecord::Base

	belongs_to :user
	validates :title,:user_id,:content,:author_ip, presence: true



end