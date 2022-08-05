require 'test_helper'

class EmailsControllerTest < ActionDispatch::IntegrationTest
  test "should get inbox" do
    get emails_inbox_url
    assert_response :success
  end

end
