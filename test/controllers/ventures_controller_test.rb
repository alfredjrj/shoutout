require 'test_helper'

class VenturesControllerTest <  ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  # test "should redirect create when not logged in" do
   # test "should redirect destroy when not logged in" do
    include Devise::Test::IntegrationHelpers
    
  def setup
     @user =  users(:david)
     @venture = @user.get_fame.ventures.first 
  end
  
  test 'should get show' do 
     get  venture_path(@user ,@venture)
    assert_response :success
  end 
  
    
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Venture.count' do
      delete venture_path(@user, @venture)
    end
    assert_redirected_to  new_user_session_path
  end
  
  test "should destroy when logged in" do
    sign_in @user
   assert_difference('Venture.count', -1) do
      delete venture_path(@user, @venture)
    end
    assert_redirected_to @user
  end
  
   test "can create a venture  when logged in" do 
    sign_in @user
    assert_difference('Venture.count', 1) do
      post "/ventures",
      params: { venture: { title: "alf beats", tags: "music , beats" , goal:"get feed back on making beatsmmmmmmkmk"} }
   end
    
     assert_redirected_to @user
     follow_redirect!
     assert_response :success
   
  end  
  
  test "can't create a venture when not logged in " do 
    sign_out @user
    assert_no_difference 'Venture.count' do
      post "/ventures",
      params: { venture: { title: "alf beats", tags: "music , beats" , goal:"get feed back on making beatsmmmmmmkmk"} }
    end
     assert_redirected_to  new_user_session_path
     follow_redirect!
    assert_response :success

   
  end  
  
end
