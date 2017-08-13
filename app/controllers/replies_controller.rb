class RepliesController < ApplicationController
  def create
    @blog = Blog.find(params[:id])
    @blog.replies.create(reply_params)
    redirect_to "/blogs/show/#{params[:id]}"
  end

  private
  def reply_params
    params.require(:reply).permit(:comment)
  end
end
