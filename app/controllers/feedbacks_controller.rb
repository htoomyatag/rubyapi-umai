require_relative './base_controller.rb'

class FeedbacksController < BaseController




# - Accept user_id or post_id, comment, owner_id
# - Check if post or user already have a feedback from same owner
# - Return feedback list form same owne


  def create

    user =  params['feedback']['user_id']  
    post =  params['feedback']['post_id']  
    owner = params['feedback']['owner_id'] 
    comment = params['feedback']['comment']  
     
    feedback = Feedback.create(user_id: user, post_id: post,owner_id:owner,comment:comment)
 
    if feedback.invalid?
          if user == ''
              @feedbacks = Feedback.where(:post_id => post).pluck(:comment)
          elsif post == ''
              @feedbacks = Feedback.where(:user_id => user).pluck(:comment)
          else
          end
          build_response render_json
    else 
          feedback.save
          status_success
    end
    
  end

end

