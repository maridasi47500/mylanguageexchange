require 'test_helper'

class TextchatControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get textchat_index_url
    assert_response :success
  end

end
