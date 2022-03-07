require_relative './base_controller.rb'

class UsersController < BaseController

  def index
   
  end

  def show

  end

  def create
     puts "all okgfgggggggggggggg"
    username = params['user']['username']
    password = params['user']['password']
    user = User.create(username: username, password: password)
    user.save
    puts "all ok"
  end

end

