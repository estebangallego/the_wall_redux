class PostsController < ApplicationController
	def create
		post = Post.new(post_params)
		if post.save
			flash[:success] = "Post added!"
			redirect_to request.referer
		else
			flash[:danger] = post.errors.full_messages
			redirect_to request.referer
		end	
	end
	private
	def post_params
		params.require(:post).permit(:post, :user_id)
	end	
end
