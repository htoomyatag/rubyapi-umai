require './app/models/user'
require './app/models/post'
require 'ffaker'
User.create([
	{ username: 'username1', password:"password" }, 
	{ username: 'username2', password:"password" }
])



#200000 POST FROM 100 USER WITH DIFFERENT IP
#  100.times do
# 	#100 user created
# 	username = FFaker::Name.unique.name
#     password  = 'password'
#     user = User.create username: username,password: password
#     2000.times do
# 	    title = FFaker::Lorem.word
# 	    content = FFaker::Lorem.paragraph
# 	    ip_address = FFaker::Internet.ip_v4_address
# 	    Post.create title: title, content: content, user_id:user.id, author_ip: ip_address
#     end
# end



#10000 FEEDBACK FROM 50 USER WITH RANDOM TEXT
# 50.times do
# 	#50 user created
# 	username = Faker::Internet.username
#     password  = Faker::Internet.password
#     user = User.create username: username,password: password
#     200.times do

#     comments = Faker::Quote.yoda 	
#     Feedback.create user_id: .. , post_id: post_id, comment:comments, owner_id: user.id

# end