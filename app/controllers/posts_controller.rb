class PostsController < ApplicationController
  def create
    @venture = Venture.find(params[:venture_id])
    @post = @venture.posts.create(post_params)
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
  
  private
  
  def post_params
    params.require(:post).permit(:text, :image ,:tags)  
  end 
  
end
