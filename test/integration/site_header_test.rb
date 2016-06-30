require 'test_helper'

class SiteHeaderTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "header links" do
   get root_path 
   assert_template 'static_pages/main'
   assert_select "a[href=?]", root_path
   assert_select "a[href=?]", discover_path
   
  end 
end
