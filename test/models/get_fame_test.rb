require 'test_helper'

class GetFameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
   def setup
    @user = User.create(name:"alfred"  , email: "alfred12@gmail.com"  , password:"whatdouwant" ,gender:"true")
    @get_fame = @user.get_fame
   end
   
  test "should be valid" do
    assert @get_fame.valid?
  end 
  
   test "user id should be present" do
     @get_fame.user_id = nil
     assert_not @get_fame.valid?
   end 
   
   
end
