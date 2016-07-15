require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get discover" do
    get discover_path
    assert_response :success
  end

  test "should get welcome" do
    get root_path
    assert_response :success
  end

end
