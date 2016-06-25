require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.create(name:"alfred"  , email: "alfred12@gmail.com"  , password:"whatdouwant" ,gender:"true")
    @venture= @user.get_fame.ventures.create(title:"music", goal: "get feed back on my music")
    @post = @venture.posts.build(text:"eadf what else")
  end 
  
  
  test "should be valid " do 
    assert @post.valid? 
  end 
  
  test "venture id should be present" do
    @post.venture_id = nil
    assert_not @post.valid? 
  end 
  
   test "order should be most recent first" do
    assert_equal posts(:most_recent), Post.first
  end
  
end
