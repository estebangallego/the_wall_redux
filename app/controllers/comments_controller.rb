class CommentsController < ApplicationController
	def create
		comment = Post.find(comment_params[:post_id]).comments.new(comment_params)
		if comment.save
			flash[:success] = "Post added!"
			redirect_to request.referer
		else
			flash[:danger] = comment.errors.full_messages
			redirect_to request.referer
		end		
		
	end
	private
	def comment_params
		params.require(:comment).permit(:comment, :user_id, :post_id)
	end
end
