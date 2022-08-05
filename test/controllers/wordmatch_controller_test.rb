require 'test_helper'

class WordmatchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wordmatch_index_url
    assert_response :success
  end

end
