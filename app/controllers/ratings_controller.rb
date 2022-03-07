require_relative './base_controller.rb'

class RatingsController < BaseController


  def index
   
    @ratings = Rating.all
    build_response render_template

  end

  def create
 
    post = params['rating']['post_id']
    rate = params['rating']['rate']

    rating = Rating.create(post_id: post, rate: rate)
  

    if rating.invalid?
          error_validation
    elsif rating.save
          post_rates = Rating.where(:post_id => post).pluck(:rate)
          @average_rating = post_rates.sum / post_rates.size
    else
          # failure when saving => status 500
    end
    return_rating average_rating

  end

  def return_rating(body, status: 200)
    [status, { "Content-Type" => "text/html" }, [body]]
  end


   def average_rating
      "average rating is #{@average_rating}"
  end





end

