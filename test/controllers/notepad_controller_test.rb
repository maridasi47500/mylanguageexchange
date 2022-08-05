require 'test_helper'

class NotepadControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get notepad_index_url
    assert_response :success
  end

  test "should get show" do
    get notepad_show_url
    assert_response :success
  end

end
