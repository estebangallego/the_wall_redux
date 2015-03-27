class WallController < ApplicationController
  def index
  	@posts = Post.all.preload(:user, :comments)
  	@user = current_user
  end
end
