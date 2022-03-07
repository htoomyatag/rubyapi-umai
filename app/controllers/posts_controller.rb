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
    post = Post.create(title: params['post']['title'])
    post.save
    redirect_to "posts/#{post.id}"
  end
end
