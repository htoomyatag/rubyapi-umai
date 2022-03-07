require_relative './base_controller.rb'


class PostsController < BaseController

   def index
    @title = "So many post"
    @posts = Post.all
    build_response render_template
  end


  def show
    @post = Post.find(params[:id])
    @title = "#{@post.title}'s page"
    build_response render_template
  end

  def new
    @title = "More post please"
    build_response render_template
  end

  def create

    title = params['post']['title']
    content = params['post']['content']
    username = params['post']['username']
    password = params['post']['password']
    ip = @request.ip

    user = User.find_by_username(params['post']['username'])
    if user && user.password == params['post']['password']
        post = Post.create(title: title, user_id: user.id, content: content, author_ip: ip)
    else
        user = User.create(username: username, password: password)
        user.save
        post = Post.create(title: title, user_id: user.id, content: content, author_ip: ip)
    end

    if post.invalid?
          error_validation
        elsif post.save
          status_success
        else
          # failure when saving => status 500
    end
   

  end
end
