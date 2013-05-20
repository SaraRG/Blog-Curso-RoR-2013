class Comment < ActiveRecord::Base
  attr_accessible :body, :commenter
  
  belongs_to :post
  belongs_to :user
end
