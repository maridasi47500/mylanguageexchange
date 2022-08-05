require 'test_helper'

class LanguageControllerTest < ActionDispatch::IntegrationTest
  test "should get lessons" do
    get language_lessons_url
    assert_response :success
  end

end
