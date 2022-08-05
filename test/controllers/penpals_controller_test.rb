require 'test_helper'

class PenpalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get penpals_index_url
    assert_response :success
  end

end
