require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
   def setup
    @user = User.create(name:"alfred"  , email: "alfred12@gmail.com"  , password:"whatdouwant" ,gender:"true")
    @profile = @user.profile
   end
   
  test "should be valid" do
    assert @profile.valid?
  end 
  
   test "user id should be present" do
     @profile.user_id = nil
     assert_not @profile.valid?
   end 
   
   
end
