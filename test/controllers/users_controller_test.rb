require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = users(:david)
  end
  
  test 'should get show' do 
    get:show, id: @user.id
    assert_response :success
  end
  
  test 'should get home' do 
    get:home
    assert_response :success
  end 
end
