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
    user = params['post']['user_id']
    content = params['post']['content']
    ip = params['post']['author_ip']

    post = Post.create(title: title, user_id: user, content: content, author_ip: ip)
    post.save
    redirect_to "posts/#{post.id}"
  end
end
