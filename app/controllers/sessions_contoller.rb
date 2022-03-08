require_relative './base_controller.rb'

class SessionsController < BaseController


  def authenticate!


    username = params['user']['username']
    password = params['user']['password']


    user = User.find_by_username(username)
    if user && user.password == password
       return 
    else
       puts "unauthorized"
    end
  end

end


