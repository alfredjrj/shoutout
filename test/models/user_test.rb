require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  

  
  def setup
    @user = User.new(name:"alfred"  , email: "alfred12@gmail.com"  , password:"whatdouwant" ,gender:"true")
  end
  
  test "should be valid" do
    assert @user.valid?
  end 
  
  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end
  
  test "name should not be to long" do 
    @user.name = "x" * 51
    assert_not @user.valid? , "name is to long "
  end 
  
  test "name should not be to short" do 
    @user.name = "xx"
    assert_not @user.valid? , "name to is short "
  end 
  
  test " gender boolean should be true true or false" do 
    @user.gender =""
    assert_not @user.valid? , "gender boolean cant be null"
  end 
  
  test "associated get_fame should be destroyed" do
    @user.save
    assert_difference 'GetFame.count', -1 do
      @user.destroy
    end
  end
  
end
