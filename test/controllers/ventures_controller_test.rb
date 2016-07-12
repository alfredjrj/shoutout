require 'test_helper'

class VenturesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
     @user =  users(:david)
     @venture = @user.get_fame.ventures.first 
  end
  
  test 'should get show' do 
   get:show, user_id: @user.id, id: @venture.id 
    # get  venture_path(@user ,@venture.id)
    assert_response :success
  end 
  
  
end
