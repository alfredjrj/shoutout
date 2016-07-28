require 'test_helper'


class UserShowLayoutTest < ActionDispatch::IntegrationTest
   include Devise::Test::IntegrationHelpers
  # test "the truth" do
  #   assert true
  # end
 
  # test "unsuccessful edit" do
  def setup
   
    @user = users(:david)
   
  end
  
   test "layout links" do
    get user_path(@user)
    assert_select "a[href=?]", promote_path
    
    @user.profile.ventures.each do  |venture| 
    assert_select "a[href=?]", venture_path(@user, venture)
    # get venture_path(@user, venture)
   end  
   
  #  delete link
  end
  
  test "rendering partials" do
    get user_path(@user)
    # assert_template 'users/show'
    # assert_template 'ventures/_index'
    # assert_template 'layouts/_sidenav_bar'
    # assert_template 'ventures/_form'
    # assert_template 'posts/_index'
    # assert_template 'layouts/_header'
  
  end 
  
  test "can create a venture " do 
    sign_in users(:david)
    post "/ventures",
    params: { venture: { title: "alf beats", tags: "music , beats" , goal:"get feed back on making beatsmmmmmmkmk"} }
    
     assert_redirected_to @user
     follow_redirect!
     assert_response :success
   
  end  
  
  test "can't create a venture" do 
    sign_out users(:david)
    post "/ventures",
    params: { venture: { title: "alf beats", tags: "music , beats" , goal:"get feed back on making beatsmmmmmmkmk"} }
   
     assert_redirected_to  new_user_session_path
     follow_redirect!
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
