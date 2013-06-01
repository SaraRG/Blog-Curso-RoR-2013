class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id, :post_id, :commenter
  
  belongs_to :post
  belongs_to :user

  validates_presence_of :body
  validates_presence_of :commenter
end
