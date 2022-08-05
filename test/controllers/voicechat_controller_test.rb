require 'test_helper'

class VoicechatControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get voicechat_index_url
    assert_response :success
  end

end
