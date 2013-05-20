class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :published, :created_at

  validates :name, :presence => true
  validates :title, :presence => true, :length => { :minimum => 5 }

  has_many :comments, :dependent => :destroy

  paginates_per 5

end
