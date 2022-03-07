class Feedback < ActiveRecord::Base

	belongs_to :user
    belongs_to :post	

    validates :comment, uniqueness: {  scope: [ :user_id, :owner_id ]}
    validates :comment, uniqueness: {  scope: [ :post_id, :owner_id ]}


end