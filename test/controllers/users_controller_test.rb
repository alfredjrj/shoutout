require 'test_helper'

class UsersControllerTest <  ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  include Devise::Test::IntegrationHelpers
 

# test "should redirect update when not logged in" do
# test "should redirect destroy when not logged in" do  / wrong user
# to login
  def setup
     @user = users(:david)
  end
  
  test 'should get show' do 
    get user_path(@user) 
    assert_response :success
  end
  
  test 'should get home' do 
    get home_path
    assert_response :success
  end 
  
  test 'should get promote' do
    get promote_path
    assert_response :success
  end
end
