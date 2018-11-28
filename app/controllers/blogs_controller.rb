#controller lets you communicate directly from model aka db and views and routes
#basically the traffic cop for all app
class BlogsController < ApplicationController
  #calls these methods before it runs it runs these methods if you are going to have repeatable code best to do a before_action
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  layout "blog"

  # GET /blogs
  # GET /blogs.json
  #on page load could do blog.limit(1) => only bring one back
  def index
    @blogs = Blog.all
    @page_title = "Blogs"
  end

  # GET /blogs/1
  # GET /blogs/1.json
  #change tab title 
  def show
    @page_title = @blog.title
  end

  # GET /blogs/new
  #does not actually create a new blog no parameters 
  def new
    @blog = Blog.new
    @page_title = "New Post"
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  # this is making new blog or 'C' of Crud notice it takes in params then performs validation
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      #if blog is valid
      if @blog.save
        #redirect_to @blog rails knows this means to show method
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        #dont need this to get up and running its for api
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #see db migrate add to post for this info
  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
    redirect_to blogs_url, notice: "Post status updated"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #set params
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
