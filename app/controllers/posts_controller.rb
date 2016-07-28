class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy ]
    
  def create
   
    @venture = Venture.find(params[:venture_id])
    @post = @venture.posts.build(post_params)
    # @venture.profile.posts.build(post_params)
    @profile = current_user.profile
    @post.profile_id = @profile.id
    # @profile = current_user.profile
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
       redirect_to venture_path(current_user, @venture)
    end    
  
  end 
  
  private
  
  def post_params
    params.require(:post).permit(:text, :image )  
  end 
  
end
