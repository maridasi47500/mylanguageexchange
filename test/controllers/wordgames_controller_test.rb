require 'test_helper'

class WordgamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wordgames_index_url
    assert_response :success
  end

end
