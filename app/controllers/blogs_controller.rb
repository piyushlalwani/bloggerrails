class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find_by(id: params[:id])
  end

  def edit
    @blog = Blog.find_by(id: params[:id])
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to @blog, notice: "Added Blog"
    else
      flash[:notice] = @blog.errors.map{|error| @blog.errors.full_messages_for(error)}
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    @blog = Blog.find_by(id: params[:id])
    if @blog.update(blog_params)
      redirect_to @blog, notice: "Updated Blog"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog = Blog.find_by(id: params[:id])
    @blog.destroy

    redirect_to root_path, status: 303
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :author_type, :content)
  end
end
