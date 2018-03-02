require 'test_helper'

class NavControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nav_index_url
    assert_response :success
  end

  test "should get add_row" do
    get nav_add_row_url
    assert_response :success
  end

  test "should get calc_nav" do
    get nav_calc_nav_url
    assert_response :success
  end

end
