class Post < ActiveRecord::Base

	validates :title,:user_id,:content,:author_ip, presence: true



end