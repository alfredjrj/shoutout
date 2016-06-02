class PostsController < ApplicationController
  def create
    @venture = Venture.find(params[:venture_id])
    @post = @venture.posts.build(post_params)
    @post.save
    redirect_to venture_path(@venture)
  end
  
  # def new
  #   @venture =  Venture.find(params{:venture_id})
    
  # end

  def show
  end

  def index
  end

  def edit
  end
  
  def destroy 
    @venture = Venture.find(params[:venture_id])
    @post = Post.find(params[:id])
    if @post.destroy
       flash[:success] = "deleted!"
       redirect_to @venture
    end    
  
  end 
  
  private
  
  def post_params
    params.require(:post).permit(:text, :image ,:tags)  
  end 
  
end
