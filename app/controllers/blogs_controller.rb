class BlogsController < ApplicationController
  def index
    @blogs = Blog.all.order('id desc')
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
    @reply = Reply.new
  end

  def like
    @blog = Blog.find(params[:id])
    @blog.like += 1
    @blog.save
    if !params[:is_show].nil? then
      redirect_to "/blogs/show/#{params[:id]}"
    else
      redirect_to "/blogs"
    end
  end

  def create
    @blog = Blog.new
    if request.post? then
      @blog = Blog.create blog_params
      redirect_to "/blogs"
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:body)
  end
end
