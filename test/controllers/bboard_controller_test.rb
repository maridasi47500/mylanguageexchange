require 'test_helper'

class BboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bboard_index_url
    assert_response :success
  end

end
