require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get discover" do
    get :discover
    assert_response :success
  end

  test "should get main" do
    get :main
    assert_response :success
  end

end
