class PostDrawer
	def self.draw(posts)
	  pdf = PDF::Writer.new
	  posts.each do |post|
	    pdf.text post.title
	  end
	  pdf.render
	end
end