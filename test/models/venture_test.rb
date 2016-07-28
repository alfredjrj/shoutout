require 'test_helper'

class VentureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup 
    @user = User.create(name:"alfred"  , email: "alfred12@gmail.com"  , password:"whatdouwant" ,gender:"true")
    @venture= @user.profile.ventures.build(title:"music", goal: "get feed back on my music")
   
  end 
  
  
  test "should be valid" do
    assert @venture.valid?
  end  
  
  test "title should be present" do
    @venture.title = " "
    assert_not @venture.valid?
  end
  
  test "title should not be to long" do 
    @venture.title = "x" * 51
    assert_not @venture.valid? , "title is to long "
  end 
  
  test "title should not be to short" do 
    @venture.title = "xx"
    assert_not @venture.valid? , "title to is short "
  end 
  
  test "goal should not be to long" do 
    @venture.goal = "x" * 251
    assert_not @venture.valid? , "goal is to long "
  end 
  
  test "goal should not be to short" do 
    @venture.goal = "x" * 9
    assert_not @venture.valid? , "goal to is short "
  end 
  
  test "get fame id should be present" do
    @venture.profile_id = nil
    assert_not @venture.valid? , "missing get fame id"
  end
  
  test "associated posts should be destroyed" do
    @venture.save
    @venture.posts.create(text: "Lorem ipsum")
    assert_difference 'Post.count', -1 do
      @venture.destroy
    end
  end

end
