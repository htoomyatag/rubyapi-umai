require_relative './base_controller.rb'

class FeedbacksController < BaseController


  def index


    allfeedbacks = Feedback.includes(:user)
  
    xml_content = Nokogiri::XML::Builder.new { |xml| 
      xml.body do
          allfeedbacks.each do |feedback|
              xml.feedback do
                xml.feedbackID feedback.id
                xml.ownername User.where(:id => feedback.owner_id).pluck(:username).join
                xml.ownercomment feedback.owner_comment
                if feedback.post_id.nil?
                xml.type "user"
                else
                xml.type "post"
                end
              end
          end
      end
    }.to_xml

    puts xml_content
    File.open('feedback.xml', 'wb') {|f| f.write xml_content }


  end


  def create

    user =  params['feedback']['user_id']  
    post =  params['feedback']['post_id']  
    owner = params['feedback']['owner_id'] 
    comment = params['feedback']['owner_comment']  
     
    feedback = Feedback.create(user_id: user, post_id: post,owner_id:owner,owner_comment:comment)
 
    if feedback.invalid?
          if user == ''
              @feedbacks = Feedback.where(:post_id => post).pluck(:owner_comment)
          elsif post == ''
              @feedbacks = Feedback.where(:user_id => user).pluck(:owner_comment)
          else
          end
          build_response render_json
    else 
          feedback.save
          status_success
    end
    
  end

end

