class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :delete ]
    
  def create
   
    @venture = Venture.find(params[:venture_id])
    @post = @venture.posts.build(post_params)
    # @venture.get_fame.posts.build(post_params)
    @get_fame = current_user.get_fame
    @post.get_fame_id = @get_fame.id
    # @get_fame = current_user.get_fame
    @post.save
    redirect_to venture_path(current_user, @venture)
  end
  
 

  def show
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
    params.require(:post).permit(:text, :image )  
  end 
  
end
