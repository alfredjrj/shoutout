require 'test_helper'


class UserShowLayoutTest < ActionDispatch::IntegrationTest
  # include Devise::Test::IntegrationHelpers
  # include Devise::TestHelpers
  
  # test "the truth" do
  #   assert true
  # end
  def sign_in(user)
    post user_session_path \
      "user[email]"    => user.email,
      "user[password]" => user.password
  end
  
  def setup
    @user = users(:david)
    sign_in(@user)
   
  end
  
  
 
  
   test "layout links" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select "a[href=?]", promote_path
    
   @user.get_fame.ventures.each do  |venture| 
    assert_select "a[href=?]", venture_path(@user, venture)
    # get venture_path(@user, venture)
   end  
   
  #  delete link
  end
  
  test "rendering partials" do
    get user_path(@user)
    assert_template 'users/show'
    assert_template 'ventures/_index'
    assert_template 'layouts/_sidenav_bar'
    assert_template 'ventures/_form'
    assert_template 'posts/_index'
    assert_template 'layouts/_header'
  
  end 
  
  test "can create a venture" do 
    puts current_user.name 
    post venture_path(@user),
    params: { ventures: { title: "alf beats", tags: "music , beats" , goal:"get feed back on making beats"} }
    # assert_response :success
    # assert_equal 'created', flash[:notice]
    # assert_response :redirect
    # follow_redirect!
    assert_redirected_to user_path(@user)
    assert_response :success
   
  end  
  
  
#   test "profile display" do
#     get user_path(@user)
#     assert_template 'users/show'
#     assert_select 'title', full_title(@user.name)
#     assert_select 'h1', text: @user.name
#     assert_select 'h1>img.gravatar'
#     assert_match @user.microposts.count.to_s, response.body
#     assert_select 'div.pagination'
#     @user.microposts.paginate(page: 1).each do |micropost|
#       assert_match micropost.content, response.body
#     end
#   end
  
  
end
