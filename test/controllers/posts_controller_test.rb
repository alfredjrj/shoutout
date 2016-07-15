require 'test_helper'

class PostsControllerTest <  ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  

  def setup
     @user =  users(:david)
     @venture = @user.get_fame.ventures.first 
     @post = @venture.posts.first 
  end
      
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Post.count' do
      delete venture_post_path( @venture, @post )
    end
    assert_redirected_to  new_user_session_path
  end
  
  test "should destroy when logged in" do
    sign_in @user
    assert_difference('Post.count', -1) do
      delete venture_post_path( @venture , @post)
    end
     assert_redirected_to  venture_path(@user,@venture)
     follow_redirect!
     assert_response :success
     
  end
  
  test "can create a post  when logged in" do 
    sign_in @user
    assert_difference('Post.count' ,1) do 
      post venture_posts_path( venture_id: @venture),
      params: { post: { text: "alf beats is better then"} }
    end 
    
    assert_redirected_to  venture_path(@user,@venture)
    follow_redirect!
    assert_response :success
   
  end 
  
  test "redirect create when not logged in " do 
    sign_out @user
    puts  venture_posts_path(user_id:@user, venture_id: @venture)
    assert_no_difference 'Post.count' do
      post venture_posts_path( user_id: @user ,venture_id: @venture),
      params: { post: { text: "alf beats is better then"} }
    end
    assert_redirected_to  new_user_session_path
    follow_redirect!
    assert_response :success
  
   end  

end
